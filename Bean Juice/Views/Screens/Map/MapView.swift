//
//  MapView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 29.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {

    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        Map(
            coordinateRegion: $viewModel.region,
            showsUserLocation: true,
            annotationItems: locationManager.cafes
        ) { cafe in
            MapAnnotation(coordinate: cafe.coordinates.coordinate) {
                Button {
                    viewModel.selectedCafe = cafe
                } label: {
                    CafePin(cafe: cafe)
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .sheet(item: $viewModel.selectedCafe) { cafe in
            CafeDetailsView(cafe: cafe)
        }
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
            viewModel.centerMapOnUserLocation()
            if locationManager.cafes.isEmpty {
                viewModel.getCafes(for: locationManager)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
