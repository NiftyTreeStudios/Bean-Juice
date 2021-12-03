//
//  Cafe.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 29.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation
import CloudKit
import MapKit

struct Cafe: Identifiable {

    // Static variables for record names
    static let kName          = "name"
    static let kWebsiteURL    = "websiteURL"
    static let kDescription   = "description"
    static let kBigAsset      = "bigAsset"
    static let kSmallAsset    = "smallAsset"
    static let kCoordinates   = "coordinates"
    static let kStreetAddress = "streetAddress"
    static let kPostalCode    = "postalCode"
    static let kCity          = "city"
    static let kState         = "state"
    static let kCountry       = "country"

    // Basic data
    let id = UUID()
    let recordID: CKRecord.ID
    let name: String
    let description: String
    let websiteURL: String

    // Image assets
    let bigAsset: CKAsset!
    let smallAsset: CKAsset!

    // Address & coordinates
    let coordinates: CLLocation
    let streetAddress: String
    let postalCode: String
    let city: String
    let state: String
    let country: String

}

extension Cafe {
    init(record: CKRecord) {
        recordID      = record.recordID
        name          = record[Cafe.kName] as? String ?? "N/A"
        description   = record[Cafe.kDescription] as? String ?? "N/A"
        websiteURL    = record[Cafe.kWebsiteURL] as? String ?? "N/A"
        bigAsset      = record[Cafe.kBigAsset] as? CKAsset
        smallAsset    = record[Cafe.kSmallAsset] as? CKAsset
        coordinates   = record[Cafe.kCoordinates] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        streetAddress = record[Cafe.kStreetAddress] as? String ?? "N/A"
        postalCode    = record[Cafe.kPostalCode] as? String ?? "N/A"
        city          = record[Cafe.kCity] as? String ?? "N/A"
        state         = record[Cafe.kState] as? String ?? "N/A"
        country       = record[Cafe.kCountry] as? String ?? "N/A"
    }

}

extension Cafe {
    /// Opens the maps app in navigation mode to the selected cafe.
    func getDirectionsToTheCafe() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinates.coordinate))
        mapItem.name = name
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking
        ])
    }

}
