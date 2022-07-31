//
//  SettingsViewModel.swift
//  SettingsViewModel
//
//  Created by Iiro Alhonen on 09.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

//This extensions allows the color to be stored in AppStorage
extension Color: RawRepresentable {

    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self = .black
            return
        }
        
        do {
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .black
            self = Color(color)
        } catch {
            self = .black
        }
    }

    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
}

final class SettingsViewModel: ObservableObject {

    static let shared = SettingsViewModel()

    // MARK: Cup size
    @AppStorage("cupSize") var cupSize: Double = 150 {
        didSet {
            objectWillChange.send()
        }
    }

    @AppStorage("selectedCup") var selectedCup: Int = 1 {
        didSet {
            objectWillChange.send()
        }
    }

    @AppStorage("customCupSize") var customCupSize: Int = 180 {
        didSet {
            objectWillChange.send()
        }
    }

    @State var cupSizes = [
        CupSize(name: "Small", sizeMl: 118),
        CupSize(name: "Medium", sizeMl: 177),
        CupSize(name: "Large", sizeMl: 236),
        CupSize(name: "X-Large", sizeMl: 355),
        CupSize(name: "Custom", sizeMl: 0)
    ]

    var selectedCupMlSize: Int {
        if cupSizes[selectedCup].name == "Custom" {
            return customCupSize
        } else {
            return cupSizes[selectedCup].sizeMl
        }
    }

    var selectedCupOzSize: Double {
        if cupSizes[selectedCup].name == "Custom" {
            return Double(customCupSize).convertMlToOz
        } else {
            return Double(selectedCupMlSize).convertMlToOz
        }
    }

    // MARK: Custom Color
    @AppStorage("accentColor") var accentColor: Color = .blue

    func getAccentColor() -> Color {
        return accentColor
    }

    // MARK: ML selection
    @AppStorage("mlSelection") var mlSelected = false {
        didSet {
            objectWillChange.send()
        }
    }

}
