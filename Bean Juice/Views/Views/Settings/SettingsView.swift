//
//  Settings.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var settings: SettingsViewModel

    var body: some View {

        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"

        NavigationView {
            List {
                Section(header: Text("Use ml instead of cups")) {
                    Toggle(isOn: $settings.mlSelected) {
                        Text("Use ml")
                    }
                }
                if !settings.mlSelected {
                    CupSelection()
                }

                HighlightColorSelection()

                Section(header: Text("Have a great cafe in mind to add to the map?")) {
                    EmailCafeRecommendationsComponent()
                }

                Section(header: Text("Enjoying using Bean Juice?")) {
                    Button {
                        StoreReviewHelper().requestReview()
                    } label: {
                        Text("Give us a rating!")
                    }
                }

                SocialMedia()

                Text("App version: " + appVersion)
                    .font(.footnote)
                    .navigationTitle("Settings")
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
    }
}
