//
//  ContentView.swift
//  BankDemo
//
//  Created by gilad on 25/10/2020.
//

import SwiftUI

struct FirstPageView : View {
    @ObservedObject var rssViewModel: RssViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Gilad Melamed")
                DateTimeView()
                DynamicLabelView(rssViewModel:rssViewModel)
                NavigationLink(destination: SecondPageView(rssViewModel:rssViewModel)) {
                    Text("Open RSS Feeds")
                }
            }
            .frame(alignment: .topLeading)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView(rssViewModel:RssViewModel())
    }
}

