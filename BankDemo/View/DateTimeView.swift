//
//  DateTimeView.swift
//  BankDemo
//
//  Created by gilad on 01/11/2020.
//

import SwiftUI

struct DateTimeView: View {
    @State var now = Date()
    
    var body: some View {
        Text("\(timeString(date: now))")
        .onAppear(perform: {let _ = self.updateTimer})
    }
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY HH:mm"
        return formatter
    }
    func timeString(date: Date) -> String {
         let time = timeFormat.string(from: date)
         return time
    }
    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 60, repeats: true,
              block: {_ in
                 self.now = Date()
               })
    }
}

struct DateTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeView()
    }
}


