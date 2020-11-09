//
//  RssData.swift
//  BankDemo
//
//  Created by gilad on 27/10/2020.
//

import Foundation

class RssData: NSObject, XMLParserDelegate {

    private var rssItems: [[Any]] = [[Any]]()    // 2 dimension: (feed ,[rss-items])
    static var color: Int = 0
    
    override init() {
        super.init()
        for t in 0..<Constants.tabs.count {
            let rssItemArray: [RssItem] = []
            rssItems.append(rssItemArray)
            self.updateRssData(t)
        }
    }

    func loadRssFeed(t: Int, compleationHandler: @escaping ([RssItem])->Void) {
        var rssItemArray: [RssItem] = []
        let feedURLs:[Feed] = Constants.tabs[t].feedList.feeds //[feed].rUrl
        DispatchQueue.global(qos: .userInitiated).async {
            for urlFeed in 0..<feedURLs.count {
                let sUrl:String = Constants.tabs[t].feedList.feeds[urlFeed].rUrl
                print ("in load rss feed for:\(sUrl)")
                if let url = URL(string: sUrl) {
                    let x = self.loadRss(forFeedId: urlFeed, feedUrl: url)
                    RssData.color += 1
                    rssItemArray.append(contentsOf: x)
                    print("tab",t," count:\(rssItemArray.count)") //no. element
                    self.rssItems[t] = rssItemArray
                }
            }
            compleationHandler(rssItemArray)
        }
    }
    func getRssItemsForTab(_ forTab: Int) -> [RssItem] {
        if let rssArray = rssItems[forTab] as? [RssItem], rssArray.count > 0 {
            return rssArray
        }
        return []
    }
    func updateRssData(_ forTab: Int) {
        loadRssFeed(t:forTab, compleationHandler: {
            let arrayOfItems = $0
            //print("download Complete forTab:",forTab,"count:", arrayOfItems.count)
            DispatchQueue.main.async {
                self.rssItems[forTab] = arrayOfItems
            }
        })
    }

    func getLastRssBuildDate(forTab: Int) -> String {
        let feedURLs:[Feed] = Constants.tabs[forTab].feedList.feeds //[feed].rUrl
        var returnValue = ""
        for url in 0..<feedURLs.count {
            let sUrl:String = Constants.tabs[forTab].feedList.feeds[url].rUrl
            if let feedUrl = URL(string: sUrl) {
                let myParser : XmlParserManager = XmlParserManager().initWithURL(feedUrl) as! XmlParserManager
                returnValue += myParser.lastBuildDate as String
            }
        }
        return returnValue
    }
    
    func loadRss(forFeedId: Int, feedUrl: URL) -> [RssItem]{
        var rssFeed : [AnyObject] = []
        var rssItemArray: [RssItem] = []
        let myParser : XmlParserManager = XmlParserManager().initWithURL(feedUrl) as! XmlParserManager
        
        rssFeed = myParser.feeds as [AnyObject]
        for i in rssFeed.indices {
            
            let x:AnyObject = rssFeed[i]
            var title:String = "[no title]"
            var pubDate:String = "[no published date]"
            if ((x["title"] as? String) != nil) {
                title = x["title"] as! String
            }
            if ((x["pubDate"] as? String) != nil) {
                pubDate = x["pubDate"] as! String
            }
            var desc = String(describing: x["description"])
            desc = desc.replacingOccurrences(of: "<img.*$", with: "", options: .regularExpression)
            desc = desc.replacingOccurrences(of: "Optional\\(", with: "", options: .regularExpression)
            let rssItem:RssItem = RssItem.init(title: title , link: "link-not-used", description: desc, pubDate: pubDate, id: forFeedId*100+i, color: RssData.color)
            rssItemArray.append(rssItem)
        }
        return rssItemArray
    }
}
 struct RssItem: Identifiable {
    var title: String
    var link: String
    var description: String
    var pubDate: String
    var id: Int
    var color: Int
}

