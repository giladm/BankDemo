//
//  BankDemoApp.swift
//  BankDemo
//
//  Created by gilad on 29/10/2020.
//

import SwiftUI

@main
struct BankDemoApp: App {
    @StateObject var rssViewModel = RssViewModel()
    var body: some Scene {
        WindowGroup {
            FirstPageView(rssViewModel:rssViewModel)
        }
    }
}
