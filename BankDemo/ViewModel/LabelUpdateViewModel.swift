//
//  LabelUpdateViewModel.swift
//  BankDemo
//
//  Created by gilad on 03/11/2020.
//

import Foundation

class LabelUpdateViewModel: ObservableObject {
    @Published var labelToUpdate: String
    init() {
        labelToUpdate = "(Empty Label)"
    }
    func updateLabel(_ label:String) {
        // other functionality
        self.objectWillChange.send()
        self.labelToUpdate = label
    }
}
