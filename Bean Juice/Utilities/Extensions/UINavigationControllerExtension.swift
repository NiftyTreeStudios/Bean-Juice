//
//  UINavigationControllerExtension.swift
//  Bean Juice
//
//  Created by Kedar Vaidya on 8/29/22.
//

import Foundation
import UIKit

extension UINavigationController {
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
