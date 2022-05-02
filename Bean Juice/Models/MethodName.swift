//
//  MethodName.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation

enum MethodName: String, Codable, CaseIterable {
    case aeropress, april, chemex, coldBrew, custom, dripMachine, frenchPress, v60
}

func getMethodName(method: MethodName) -> String {
    switch method {
    case .aeropress:
        return "AeroPress"
    case .april:
        return "April"
    case .chemex:
        return "Chemex"
    case .coldBrew:
        return "Cold Brew"
    case .custom:
        return "Custom"
    case .dripMachine:
        return "Drip Machine"
    case .frenchPress:
        return "French Press"
    case .v60:
        return "V60"
    }
}

extension MethodName: Identifiable {
    var id: MethodName { self }
}
