//
//  MethodSelectionViewModel.swift
//  MethodSelectionViewModel
//
//  Created by Iiro Alhonen on 09.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

final class MethodSelectionViewModel: ObservableObject {

    let brewMethods: [Method] = [
        Method(name: .aeropress, maxWaterAmount: 230, mlPickerStep: 5, grounds: "Medium/Fine", startRatio: 13),
        Method(name: .chemex, maxWaterAmount: 1180, mlPickerStep: 10, grounds: "Medium/Coarse", startRatio: 17),
        Method(name: .coldBrew, maxWaterAmount: 1000, mlPickerStep: 100, grounds: "Coarse", startRatio: 15),
        Method(name: .dripMachine, maxWaterAmount: 1500, mlPickerStep: 100, grounds: "Medium", startRatio: 16),
        Method(name: .frenchPress, maxWaterAmount: 1500, mlPickerStep: 10, grounds: "Coarse", startRatio: 18),
        Method(name: .v60, maxWaterAmount: 1000, mlPickerStep: 5, grounds: "Medium", startRatio: 17)
    ]

}
