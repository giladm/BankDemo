//
//  RssViewModel.swift
//  BankDemo
//
//  Created by gilad on 27/10/2020.
//
// ViewModle
//
import Foundation

class RssViewModel: ObservableObject {
    @Published  var rssData: RssData
    @Published var selectedTab: Int
    @Published var labelToUpdate: String
    @Published var isLabelHideen: Bool
    private var lastUpdated: [String] = []

    init() {
        labelToUpdate = "(hidden)"
        isLabelHideen = true
        self.selectedTab = 0
        self.rssData = RssData()
        for _ in 0..<Constants.tabs.count {
            self.lastUpdated.append(String (""))
        }
    }
    // Which tab is currently selected
    func updateSelectedTab(_ tab:Int) {
        self.selectedTab = tab
    }
    func updateLabel(_ tab: Int) {
        labelToUpdate = Constants.tabs[tab].feedList.header
        updateSelectedTab(tab)
        isLabelHideen = false
    }
    
    func getRssData(_ tab: Int) -> [RssItem] {
        return rssData.getRssItemsForTab(tab)
    }
    
    func updateRssData(_ forTab:Int) {
        rssData.updateRssData(forTab)
    }

    func startRssCheckTimer() {
         Timer.scheduledTimer(withTimeInterval: 15, repeats: true,
              block: {_ in
                for t in 0..<Constants.tabs.count {
                    let lastBuildDate = self.rssData.getLastRssBuildDate(forTab: t)
                    if self.lastUpdated[t] == lastBuildDate {
                        continue // to next tab
                    } else { // rss feed was updated.
                        print("tab",t, "need update") //:\(lastBuildDate)")
                        self.updateRssData(t) // get and replace the new feed
                        self.lastUpdated[t] = lastBuildDate
                    }
                }
               })
    }
}
