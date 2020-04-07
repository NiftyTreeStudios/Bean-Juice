//
//  Settings.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    var cupSizes = [
        CupSize(name: "Small", sizeMl: 118, sizeOz: 4),
        CupSize(name: "Medium", sizeMl: 177, sizeOz: 6),
        CupSize(name: "Large", sizeMl: 236, sizeOz: 8),
        CupSize(name: "X-Large", sizeMl: 355, sizeOz: 12),
        CupSize(name: "Bucket", sizeMl: 473, sizeOz: 16)
    ]
    
    @State private var selectedOption: Int = 1
    @Binding var cupSize: Double
    
    var body: some View {
        let selection = Binding<Int>(get: {
            return self.selectedOption
        }, set: {
            self.selectedOption = $0
            self.cupSize = Double(self.cupSizes[$0].sizeMl)
        })
        
        return NavigationView {
            Form {
                Text("Coffee cup size ☕️")
                Picker("Cup size", selection: selection) {
                    ForEach(0..<cupSizes.count) {
                        Text(self.cupSizes[$0].name)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Text("Picked size: " + "\(self.cupSizes[selectedOption].sizeMl) ml.")
                Text("Picked size: " + "\(self.cupSizes[selectedOption].sizeOz) oz.")
            .navigationBarTitle("Settings")
            }
        }
    }
}

//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
