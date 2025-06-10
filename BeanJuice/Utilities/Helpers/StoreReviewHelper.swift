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

    static func incrementAppOpenedCount() { // called from appdelegate didfinishLaunchingWithOptions:
        guard var appOpenCount = UserDefaults.standard.value(forKey: UserDefaultsKeys.APPOPENEDCOUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: UserDefaultsKeys.APPOPENEDCOUNT)
            return
        }
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: UserDefaultsKeys.APPOPENEDCOUNT)
    }

    @MainActor static func checkAndAskForReview() {
        // Call this whenever appropriate.
        // This will not be shown everytime. Apple has some internal logic on how to show this.
        guard let appOpenCount = UserDefaults.standard.value(forKey: UserDefaultsKeys.APPOPENEDCOUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: UserDefaultsKeys.APPOPENEDCOUNT)
            return
        }

        switch appOpenCount {
        case 10, 50:
            StoreReviewHelper().requestReview()
        case _ where appOpenCount % 100 == 0:
            StoreReviewHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
        }
    }

    @MainActor func requestReview() {
        if let scene = UIApplication.shared.currentScene {
            AppStore.requestReview(in: scene)
        }
    }
}

extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}

struct UserDefaultsKeys {
    static let APPOPENEDCOUNT = "APP_OPENED_COUNT"
}
