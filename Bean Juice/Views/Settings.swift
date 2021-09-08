//
//  Settings.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.3.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices
import StoreKit

struct SettingsView: View {

    @Binding var mlSelected: Bool
    @Binding var customColor: Color

    var body: some View {

        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"

        NavigationView {
            List {
                Section(header: Text("Use ml instead of cups")) {
                    Toggle(isOn: $mlSelected) {
                        Text("Use ml")
                    }
                }
                if !mlSelected {
                    CupSelection()
                }

                HighlightColorSelection(customColor: $customColor)

                Section(header: Text("Enjoying using Bean Juice?")) {
                    Button(action: {
                        // Review button
                        StoreReviewHelper().requestReview()
                    }) {
                        Text("Give us a rating!")
                    }
                }

                SocialMedia()

                Text("App version: " + appVersion)
                    .font(.footnote)
                    .navigationTitle("Settings")
            }.listStyle(GroupedListStyle())
        }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }
}
