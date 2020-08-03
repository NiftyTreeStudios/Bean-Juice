//
//  StoreReviewHelper.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 3.8.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import StoreKit

struct StoreReviewHelper {
    let Defaults = UserDefaults.standard
    
    static func incrementAppOpenedCount() { // called from appdelegate didfinishLaunchingWithOptions:
        guard var appOpenCount = Defaults.value(forKey: UserDefaultsKeys.APP_OPENED_COUNT) as? Int else {
            Defaults.set(1, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
            return
        }
        appOpenCount += 1
        Defaults.set(appOpenCount, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
    }
    static func checkAndAskForReview() { // call this whenever appropriate
        // this will not be shown everytime. Apple has some internal logic on how to show this.
        guard var appOpenCount = Defaults.value(forKey: UserDefaultsKeys.APP_OPENED_COUNT) as? Int else {
            Defaults.set(1, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
            return
        }
        
        switch appOpenCount {
        case 10,50:
            StoreReviewHelper().requestReview()
        case _ where appOpenCount%100 == 0 :
            StoreReviewHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
            break;
        }
        
    }
    fileprivate func requestReview() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
            // Try any other 3rd party or manual method here.
        }
    }
}

struct UserDefaultsKeys {
    static let APP_OPENED_COUNT = "APP_OPENED_COUNT”
}
