//
//  Main.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.06.21.
//
import SwiftUI

@main
struct BeanJuice: App {

    @State private var showSplashScreen: Bool = true
    
    var body: some Scene {

        let locationManager = LocationManager()

        WindowGroup {
            ZStack {
                BJTabView()
                    .environmentObject(locationManager)
                if showSplashScreen {
                    SplashScreen()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    showSplashScreen = false
                }
            }
        }
    }
}
