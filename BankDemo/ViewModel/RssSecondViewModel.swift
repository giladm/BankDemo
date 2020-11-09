//
//  RssSecondViewModel.swift
//  BankDemo
//
//  Created by gilad on 27/10/2020.
//
// ViewModle
//
import Foundation

class RssSecondViewModel: ObservableObject {
    @Published  var rssData: RssData
    let rssURLs:[String] = [String(Constants.secondRssTab.rssUrl1["url"]!),String(Constants.secondRssTab.rssUrl2["url"]!)]

    init() {
        rssData = RssData(rssURLs)
    }
    func getRssArray() -> [RssItem] {
        var returnItems: [RssItem] = []
        for feed in 0..<(rssURLs.count) {
            returnItems.append(contentsOf: rssData.rssArray(feed))
        }
        return returnItems
    }
}
