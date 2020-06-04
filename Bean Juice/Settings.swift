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
    
    var colors = [
        ColorData(name: "Default", color: Color.primary),
        ColorData(name: "Blue", color: Color.blue),
        ColorData(name: "Green", color: Color.green),
        ColorData(name: "Orange", color: Color.orange),
        ColorData(name: "Pink", color: Color.pink),
        ColorData(name: "Purple", color: Color.purple),
        ColorData(name: "Red", color: Color.red),
        ColorData(name: "Yellow", color: Color.yellow)
    ]
    
    @State private var selectedCup: Int = 1
    @Binding var cupSize: Double
    
    @State private var selectedColor: Int = 0
    @Binding var customColor: Color
    
    var body: some View {
        let cupSelection = Binding<Int>(get: {
            return self.selectedCup
        }, set: {
            self.selectedCup = $0
            self.cupSize = Double(self.cupSizes[$0].sizeMl)
        })
        
        let colorSelection = Binding<Int>(get: {
            return self.selectedColor
        }, set: {
            self.selectedColor = $0
            self.customColor = self.colors[$0].color
        })
        
        return NavigationView {
            Form {
                Section(header: Text("Cup size")
                    .font(.subheadline), footer: Text("Picked size: "  + "\(self.cupSizes[selectedCup].sizeMl) ml. or "  + "\(self.cupSizes[selectedCup].sizeOz) oz.")) {
                    Picker("Cup size", selection: cupSelection) {
                        ForEach(0..<cupSizes.count) {
                            Text(self.cupSizes[$0].name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Select highlight color")
                    .font(.subheadline), footer: Text("This will affect what highlight color the app uses.")) {
                        Picker("", selection: colorSelection) {
                            ForEach(0 ..< colors.count) {
                                Text(self.colors[$0].name)
                                    .tag($0)
//                                Circle().foregroundColor(self.colors[$0].color)
                            }
                        }
                }
                .navigationBarTitle("Settings", displayMode: .inline)
            }
        }
    }
}

//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
