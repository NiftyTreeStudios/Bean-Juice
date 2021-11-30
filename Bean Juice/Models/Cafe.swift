//
//  Cafe.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 29.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import Foundation
import CoreLocation

struct Cafe: Identifiable {
    // Basic data
    let id = UUID()
    let name: String
    let imageURL: URL? = nil
    // Address & coordinates
    let coordinates: CLLocationCoordinate2D
    let streetAddress: String? = nil
    let postalCode: String? = nil
    let city: String? = nil
    let state: String? = nil
    let country: String? = nil
}
