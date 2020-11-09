//
//  RssSecondTabView.swift
//  BankDemo
//
//  Created by gilad on 29/10/2020.
//

import SwiftUI

struct RssSecondView: View {
    @ObservedObject var rssViewModel: RssSecondViewModel
    let colorBlue = Color.blue.opacity(0.3)
    let colorGreen = Color.green.opacity(0.3)
    let columns = [
        GridItem(.flexible())
    ]
    let header:String = String(Constants.secondRssTab.rssUrl1["header"]!)
// compare to 1st rss view
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text(header)
            })
            LazyVGrid(columns: columns) {
                let itemArray:[RssItem] = rssViewModel.getRssArray()
                ForEach (itemArray) { rssItem in
                    Text(rssItem.title)
                        .font(.headline)
                        .background(rssItem.color % 2 == 0 ? colorBlue : colorGreen )

                    Text("Posted: "+rssItem.pubDate)
                        .font(.footnote)
                        .background(rssItem.color % 2 == 0 ? colorBlue : colorGreen )
                    Text(rssItem.description)
                        .font(.body)
                        .background(rssItem.color % 2 == 0 ? colorBlue : colorGreen )
                    Divider()
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal)
              }
        }
    }
}

struct RssSecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        RssSecondView(rssViewModel: RssSecondViewModel())
        
    }
}

