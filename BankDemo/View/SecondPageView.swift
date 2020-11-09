//
//  SecondPageView.swift
//  BankDemo
//
//  Created by gilad on 29/10/2020.
//

import SwiftUI

struct SecondPageView: View {
    @ObservedObject var rssViewModel: RssViewModel
    @State var defaultTab:Int = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // overriding back arrow

    var body: some View {
        TabView (selection: $defaultTab){
            RssView(rssViewModel: rssViewModel,selectedTab:0)
             .tabItem {
                Image(systemName: Constants.tabs[0].feedList.tabImage)
                Text(Constants.tabs[0].feedList.header).onAppear{rssViewModel.startRssCheckTimer()}
             }
            .tag(0)
            RssView(rssViewModel: rssViewModel,selectedTab:1)
             .tabItem {
                Image(systemName: Constants.tabs[1].feedList.tabImage)
                Text(Constants.tabs[1].feedList.header)
             }
            .tag(1)
        }
        .onChange(of: defaultTab) { value in
            rssViewModel.updateSelectedTab(value)
//            print("Selection changed to \(rssViewModel.selectedTab)")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        rssViewModel.updateLabel(defaultTab)
        }) {
            HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                Text("Back")
            }
        }
    }
}

// To add another tab
//            RssView(rssViewModel: rssViewModel,selectedTab:2)
//             .tabItem {
//                Image(systemName: Constants.tabs[2].feedList.tabImage)
//                Text(Constants.tabs[2].feedList.header)
//             }
//            .tag(2)

