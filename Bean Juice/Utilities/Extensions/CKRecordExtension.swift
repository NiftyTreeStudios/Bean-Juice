//
//  CKRecordExtension.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 01.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import CloudKit

extension CKRecord {

    func convertToCafe() -> Cafe { Cafe(record: self) }

}
