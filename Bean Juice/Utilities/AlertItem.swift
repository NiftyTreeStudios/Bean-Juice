//
//  AlertItem.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 02.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct AlertItem: Identifiable {

    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button

}

struct AlertContext {

    // MARK: MapView errors
    static let unableToGetCafes = AlertItem(
        title: Text("Cafes error"),
        message: Text("Unable to retrieve cafes at this time.\nPlease try again."),
        dismissButton: .default(Text("Ok"))
    )

    static let unableToGetUserLocation = AlertItem(
        title: Text("Location error"),
        message: Text("Unable to retrieve user location at this time.\nPlease try again."),
        dismissButton: .default(Text("Ok"))
    )

    // MARK: Location permission errors
    static let locationRestricted = AlertItem(
        title: Text("Location restricted"),
        message: Text("Your location is restricted. This may be due to parental controls."),
        dismissButton: .default(Text("Ok"))
    )

    static let locationDenied = AlertItem(
        title: Text("Location denied"),
        message: Text("Bean Juice does not have permission to access your location. To change that, go to your phone's Settings -> Bean Juice -> Location"),
        dismissButton: .default(Text("Ok"))
    )

    static let locationDisabled = AlertItem(
        title: Text("Location disabled"),
        message: Text("Your phone's location services are disabled. To change that, go to your phone's Settings -> Privacy -> Location Services"),
        dismissButton: .default(Text("Ok"))
    )

}
