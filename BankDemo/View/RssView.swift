//
//  RssView.swift
//  BankDemo
//  Display rss feed for the tab selected
//  Created by gilad on 25/10/2020.
//
import SwiftUI

struct RssView: View {
    @ObservedObject var rssViewModel: RssViewModel
//    @Binding var selectedTab:Int
    var selectedTab:Int
    
    let colorArray = [Color.red.opacity(0.2),Color.green.opacity(0.2),Color.blue.opacity(0.2),Color.yellow.opacity(0.2),Color.orange.opacity(0.2)]
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            let header:String = Constants.tabs[selectedTab].feedList.header
            VStack (alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text(header)
            })
            LazyVGrid(columns: columns) {
                let itemArray:[RssItem] = rssViewModel.getRssData(selectedTab)
                ForEach (itemArray) { rssItem in
                    Text(rssItem.title)
                        .font(.headline)
                        .background(colorArray[rssItem.color])
                    Text("Posted: "+rssItem.pubDate)
                        .font(.footnote)
                        .background(colorArray[rssItem.color])
                    Text(rssItem.description)
                        .font(.body)
                        .background(colorArray[rssItem.color])
                    Divider()
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
              }
            .padding(.horizontal)
        }
    }
}

struct RssView_Previews: PreviewProvider {
    var selectedTab = 1
    static var previews: some View {
        RssView(rssViewModel: RssViewModel(), selectedTab: 1 )
    }
}

