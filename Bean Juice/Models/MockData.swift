//
//  MockData.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 30.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import CloudKit

struct MockData {

    static var cafe: CKRecord {
        let record = CKRecord(recordType: RecordType.cafe)

        record[Cafe.kName] = "Test cafe"
        record[Cafe.kWebsiteURL] = "https://www.google.com"
        record[Cafe.kDescription] = "This is a longer description for the cafe. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vestibulum tortor ac lobortis varius. Curabitur nibh ligula, convallis ornare tempor quis, rutrum vel metus. Etiam pretium ultricies neque ut facilisis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin efficitur non sem sit amet semper. Fusce ac mauris feugiat, convallis nunc id, rhoncus ligula. Vestibulum sit amet fermentum metus. Sed ac massa ipsum. In dapibus vitae enim in sagittis. Pellentesque vehicula leo at justo commodo, a fringilla dolor interdum. Duis porta eleifend vehicula. Donec congue viverra felis, non auctor lacus congue ut. Sed dictum, diam eu viverra vehicula, turpis neque dapibus risus, ac malesuada massa orci a mauris. Ut non arcu dignissim, ultrices urna vitae, viverra tortor. Praesent a blandit sem. Integer vehicula, ex vel fermentum viverra, libero elit ullamcorper ligula, non hendrerit tellus arcu eget diam."
        record[Cafe.kCoordinates] = CLLocation(latitude: 37.336, longitude: -122.010)
        record[Cafe.kStreetAddress] = "Teststreet 123"
        record[Cafe.kPostalCode] = "12345"
        record[Cafe.kCity] = "Bremen"
        record[Cafe.kState] = "Bremen"
        record[Cafe.kCountry] = "Germany"

        return record
    }

}
