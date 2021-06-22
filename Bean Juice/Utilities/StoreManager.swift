//
//  StoreManager.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.06.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation
import StoreKit

class StoreManager: NSObject, ObservableObject, SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("Did get a response")
    }
}
