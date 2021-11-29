//
//  MapView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 29.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.334_900,
            longitude: -122.009_020
        ),
        latitudinalMeters: 2000,
        longitudinalMeters: 2000
    )

    var body: some View {
        Map(
            coordinateRegion: $region,
            showsUserLocation: true
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
