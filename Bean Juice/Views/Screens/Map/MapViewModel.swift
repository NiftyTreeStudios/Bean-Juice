//
//  MapViewModel.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 02.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import MapKit

final class MapViewModel: NSObject, ObservableObject {

    @Published var alertItem: AlertItem?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 53.0680416815,
            longitude: 8.7904608281
        ),
        latitudinalMeters: 2000,
        longitudinalMeters: 2000
    )
    @Published var selectedCafe: Cafe?

    var deviceLocationManager: CLLocationManager?

    /// Checks if the device has location services enabled.
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            deviceLocationManager = CLLocationManager()
            deviceLocationManager!.delegate = self
        } else {
            alertItem = AlertContext.locationDisabled
        }
    }

    /// Checks if user has allowed location data usage. If not, show alert.
    private func checkLocationAuthorization() {
        guard let deviceLocationManager = deviceLocationManager else { return }
        switch deviceLocationManager.authorizationStatus {
            case .notDetermined:
                deviceLocationManager.requestWhenInUseAuthorization()
            case .restricted:
                alertItem = AlertContext.locationRestricted
            case .denied:
                alertItem = AlertContext.locationDenied
            case .authorizedAlways, .authorizedWhenInUse:
                break
            @unknown default:
                break
        }
    }

    /// Sets the center point of the map to the users location.
    func centerMapOnUserLocation() {
        guard let deviceLocation = deviceLocationManager?.location else { return }
        region.center = deviceLocation.coordinate
    }

    /**
     Get the cafes from iCloud database and adds them to the `LocationManager`s array of cafes.
     
     - Parameter locationManager: the location manager used.
     */
    func getCafes(for locationManager: LocationManager) {
        CloudKitHelper.getCafes { [self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let cafesArray):
                        locationManager.cafes = cafesArray
                    case .failure(_):
                        alertItem = AlertContext.unableToGetCafes
                }
            }
        }
    }
}

/// Extends `MapViewModel` with `CLLLocationManagerDelegate`.
extension MapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
