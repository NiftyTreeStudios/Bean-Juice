//
//  CloudKitHelper.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 01.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import CloudKit

struct CloudKitHelper {

    static let kCKIdentifier = "iCloud.com.niftytreestudios.BeanJuice"

    static func getCafes(completed: @escaping (Result<[Cafe], Error>) -> Void) {
        let query = CKQuery(
            recordType: RecordType.cafe,
            predicate: NSPredicate(value: true)
        )
        // Default would be CKContainer.default().public...
        CKContainer(identifier: kCKIdentifier).publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            guard let records = records else { return }

            let cafes = records.map { $0.convertToCafe() }
            completed(.success(cafes))
        }
    }
}
