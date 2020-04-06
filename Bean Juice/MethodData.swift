//
//  MethodData.swift
//  brewer
//
//  Created by Iiro Alhonen on 30.1.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation

struct Method {
    let name: String
    // let waterAmount: Int
    let cupAmount: Int
    let grounds: String
    let startRatio: Int
}

let brewMethods: [Method] = [
    Method(name: "Chemex", cupAmount: 8, grounds: "Medium/Coarse", startRatio: 17),
    Method(name: "Aeropress", cupAmount: 4, grounds: "Medium/Fine", startRatio: 13),
    Method(name: "V60", cupAmount: 8, grounds: "Medium", startRatio: 17)
]
