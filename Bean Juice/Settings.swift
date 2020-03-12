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
    
    @State private var selectedOption = 1
    
    var body: some View {
        NavigationView {
            Form {
                Text("Pick your cup size")
                Picker(selection: $selectedOption, label: Text("Select cup size")) {
                    ForEach(cupSizes, id: \.name) { cupSize in
                        Text("\(cupSize.name)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            .navigationBarTitle("Settings")
            }
        }
    }
}
