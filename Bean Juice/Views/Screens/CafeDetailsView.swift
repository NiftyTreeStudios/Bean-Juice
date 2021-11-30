//
//  CafeDetailsView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 30.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import MapKit

struct CafeDetailsView: View {

    let cafe: Cafe

    var body: some View {
        ScrollView {
            Text(cafe.name).font(.title)
        }.padding()
    }
}

struct CafeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CafeDetailsView(cafe: Cafe(
            name: "Test",
            coordinates: CLLocationCoordinate2D(
                latitude: 37.336,
                longitude: -122.010
            )
        ))
    }
}
