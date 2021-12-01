//
//  CloudKitHelper.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 01.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import CloudKit

struct CloudKitHelper {
    
    static func getCafes(completed: @escaping (Result<[Cafe], Error>) -> Void) {
        let query = CKQuery(
            recordType: RecordType.cafe,
            predicate: NSPredicate(value: true)
        )
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return
            }

            guard let records = records else { return }

            var cafes: [Cafe] = []

            for record in records {
                let cafe = Cafe(record: record)
                cafes.append(cafe)
            }
            
            completed(.success(cafes))
        }
    }
}
