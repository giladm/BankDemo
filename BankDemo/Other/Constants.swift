//
//  Constants.swift
//  BankDemo
//
//  Created by gilad on 30/10/2020.
//

struct Tabs {
    var feedList:FeedList
}
struct FeedList {
    var header:String
    var tabImage:String // Icon for the display tab
    var feeds: [Feed] // single tab might have more than one feed
}
struct Feed {
    var rUrl:String
}

struct Constants {
    static let feed1:Feed = Feed(rUrl: "http://rss.cnn.com/rss/edition_travel.rss")
    static let aList:FeedList = FeedList(header: "Travel",tabImage:"airplane", feeds: [feed1])
    static let tab0:Tabs = Tabs(feedList: aList)
    
    
    static let feed2:Feed = Feed(rUrl: "http://rss.cnn.com/rss/edition_sport.rss") //World Sport
    static let feed3:Feed = Feed(rUrl: "http://rss.cnn.com/rss/edition_entertainment.rss") //Entertainment
    static let bList:FeedList = FeedList(header: "Sport & Entertainment",tabImage:"globe", feeds: [feed2,feed3])
    static let tab1:Tabs = Tabs(feedList: bList)

    static let tabs:[Tabs] = [tab0,tab1]
    
    // To add another tab
//    static let feed4:Feed = Feed(rUrl: "http://rss.cnn.com/rss/edition.rss")
//    static let cList:FeedList = FeedList(header: "Top",tabImage:"clock", feeds: [feed4])
//    static let tab2:Tabs = Tabs(feedList: cList)
//    static let tabs:[Tabs] = [tab0,tab1,tab2]
}
