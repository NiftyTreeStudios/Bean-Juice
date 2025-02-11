//
//  CKAssetExtension.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 02.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import UIKit
import CloudKit

extension CKAsset {
    func convertToUIImage() -> UIImage {
        let placeholder = PlaceholderImage.defaultGradient
        guard let fileUrl = self.fileURL else { return placeholder }
        do {
            let data = try Data(contentsOf: fileUrl)
            return UIImage(data: data) ?? placeholder
        } catch {
            return placeholder
        }
    }
}
