//
//  DoubleExtension.swift
//  DoubleExtension
//
//  Created by Iiro Alhonen on 09.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation

extension Double {

    /**
     Converts ml amount to oz.
     
     - Returns: the oz amount for the ml.
     */
    var convertMlToOz: Double {
        let ozAmount = self / 29.57353193
        return ((ozAmount * 10).rounded(.toNearestOrAwayFromZero)) / 10
    }

}
