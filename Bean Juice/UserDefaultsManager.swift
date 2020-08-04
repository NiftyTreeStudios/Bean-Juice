//
//  UserDefaultsManager.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 29.7.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation

class UserDefaultsManager: ObservableObject {
    // ml or cup toggle
    @Published var mlSelected: Bool = UserDefaults.standard.bool(forKey: "mlSelected") {
        didSet { UserDefaults.standard.set(self.mlSelected, forKey: "mlSelected") }
    }
    
    // selected cup
    @Published var selectedCup: Int = UserDefaults.standard.integer(forKey: "selectedCup") {
        didSet { UserDefaults.standard.set(self.selectedCup, forKey: "selectedCup") }
    }
}
