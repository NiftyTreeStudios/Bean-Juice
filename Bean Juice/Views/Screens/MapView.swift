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

    @State private var selectedCafe: Cafe?

    private var cafes: [Cafe] = [
        Cafe(record: MockData.cafe)
    ]

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
            showsUserLocation: true,
            annotationItems: cafes
        ) { cafe in
            MapAnnotation(
                coordinate: CLLocationCoordinate2D(
                    latitude: cafe.coordinates.coordinate.latitude,
                    longitude: cafe.coordinates.coordinate.longitude
                )
            ) {
                Button {
                    selectedCafe = cafe
                } label: {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.linearGradient(colors: [.teal, .pink], startPoint: .bottomLeading, endPoint: .topTrailing))
                }
            }
        }.sheet(item: $selectedCafe) { cafe in
            CafeDetailsView(cafe: cafe)
        }
        .onAppear {
            CloudKitHelper.getCafes { result in
                switch result {
                case .success(let cafes):
                    print(cafes)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
