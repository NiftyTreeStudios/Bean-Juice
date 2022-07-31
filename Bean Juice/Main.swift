//
//  Main.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.06.21.
//
import SwiftUI

@main
struct BeanJuice: App {
    var body: some Scene {

        let locationManager = LocationManager()

        WindowGroup {
            BJTabView().environmentObject(locationManager)
        }
    }
}
