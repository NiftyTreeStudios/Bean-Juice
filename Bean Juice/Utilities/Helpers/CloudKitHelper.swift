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
        Task {
            do {
                let matchResults = try await CKContainer(identifier: kCKIdentifier)
                    .publicCloudDatabase // Default would be CKContainer.default().public...
                    .records(matching:query)
                    .matchResults
                let cafes = matchResults
                    .map { $0.1 }
                    .compactMap { try? $0.get() }
                    .compactMap(Cafe.init)
                completed(.success(cafes))
            }
            catch {
                completed(.failure(error))
            }
        }
    }
}
