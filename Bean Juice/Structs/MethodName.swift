//
//  MethodName.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.03.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation

enum MethodName {
    case aeropress, chemex, custom, frenchPress, v60, moccamaster
}

func getMethodName(method: MethodName) -> String {
    switch method {
    case .aeropress:
        return "Aeropress"
    case .chemex:
        return "Chemex"
    case .custom:
        return "Custom"
    case .frenchPress:
        return "French Press"
    case .v60:
        return "V60"
    case .moccamaster:
        return "Moccamaster"
    }
}
