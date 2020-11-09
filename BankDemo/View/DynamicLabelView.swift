//
//  DynamicLabelView.swift
//  BankDemo
//
//  Created by gilad on 04/11/2020.
//

import SwiftUI

struct DynamicLabelView: View {
    @ObservedObject var rssViewModel: RssViewModel

    var body: some View {
        NavigationLink(destination: RssView(rssViewModel: rssViewModel,selectedTab:rssViewModel.selectedTab)) {
            Text(rssViewModel.labelToUpdate)
        }
        .isHidden(rssViewModel.isLabelHideen)
    }
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

// Extenssion to View -> Hide or show the view based on a boolean value.
// Example for visibility:
// Text("Label")
//     .isHidden(true)
//
// Example for complete removal:
// Text("Label")
//     .isHidden(true, remove: true)
// - Parameters:
//   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
//   - remove: Boolean value indicating whether or not to remove the view.

