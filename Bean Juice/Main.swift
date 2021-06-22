//
//  Main.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.06.21.
//
import SwiftUI

@main
struct BeanJuice: App {

    @StateObject var storeManager = StoreManager()

    var body: some Scene {
        WindowGroup {
            ContentView(storeManager: storeManager)
        }
    }
}
