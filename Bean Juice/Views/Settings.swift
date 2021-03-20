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

    @State var cupSizes = [
        CupSize(name: "Small", sizeMl: 118),
        CupSize(name: "Medium", sizeMl: 177),
        CupSize(name: "Large", sizeMl: 236),
        CupSize(name: "X-Large", sizeMl: 355),
        CupSize(name: "Custom", sizeMl: 100)
    ]

    var colors = [
        CustomColor(name: "Blue", color: Color.blue),
        CustomColor(name: "Green", color: Color.green),
        CustomColor(name: "Orange", color: Color.orange),
        CustomColor(name: "Pink", color: Color.pink),
        CustomColor(name: "Purple", color: Color.purple),
        CustomColor(name: "Red", color: Color.red),
        CustomColor(name: "Yellow", color: Color.yellow)
    ]

    @Binding var mlSelected: Bool
    @AppStorage(wrappedValue: 1, "selectedCup") var selectedCup: Int
    @Binding var cupSize: Double
    @State var customCup = 0
    @State private var selectedColor: Int = 0
    @Binding var customColor: Color

    @State var showSafari = false
    @State var urlString = "https://duckduckgo.com"

    var body: some View {
        let colorSelection = Binding<Int>(get: {
            return self.selectedColor
        }, set: {
            self.selectedColor = $0
            self.customColor = self.colors[$0].color
        })

        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"

        return NavigationView {
            Form {
                Section(header: Text("Use ml instead of cups")) {
                    Toggle(isOn: $mlSelected) {
                        Text("Use ml")
                    }
                }
                if !mlSelected {
                    Section(header: Text("Cup size")
                                        .font(.subheadline),
                            footer: Text("Picked size: "  + "\(self.cupSizes[selectedCup].sizeMl) ml. or "  + "\(round((Double(self.cupSizes[selectedCup].sizeMl) )/(29.574)*10)/10) oz.")) {
                        Picker("Cup size", selection: Binding(get: {selectedCup}, set: { newValue in
                                                                selectedCup = newValue
                                                                cupSize = Double(cupSizes[newValue].sizeMl)})) {
                            ForEach(0 ..< cupSizes.count, id: \.self) {
                                Text(self.cupSizes[$0].name)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())

                        // if custom is selected a textfield is presented
                        if $selectedCup.wrappedValue == 4 {
                            Picker("Custom cup size", selection: $customCup) {
                                ForEach(0 ..< 1001) { number in
                                    if number >= 100 && (number % 5) == 0 {
                                        Text("\(number)")
                                    }
                                }
                            }.pickerStyle(InlinePickerStyle())
                        }
                    }.onChange(of: customCup, perform: { value in
                        cupSizes[4].sizeMl = Int(value)
                        cupSize = Double(value)
                    })
                }

                Section(header: Text("Select highlight color")
                    .font(.subheadline), footer: Text("This will affect what highlight color the app uses.")) {
                        Picker("Color", selection: colorSelection) {
                            ForEach(0 ..< colors.count, id: \.self) { color in
                                Text(self.colors[color].name)
                                    .tag(color)
                            }
                        }
                }
                Section(header: Text("Enjoying using Bean Juice?")) {
                    Button(action: {
                        // Review button
                        StoreReviewHelper().requestReview()
                    }) {
                        Text("Give us a rating!")
                    }
                }
                Section(header: Text("Follow us on social media")
                    .font(.subheadline), footer: Text("@BeanJuiceApp"), content: {
                    Button(action: {
                        // Open Instagram
                        self.urlString = "https://www.instagram.com/BeanJuiceApp"
                        self.showSafari = true
                    }) {
                        Text("Instagram")
                    }
                    // summon the Safari sheet
                    .sheet(isPresented: $showSafari) {
                        SafariView(url: URL(string: self.urlString)!)
                    }
                    Button(action: {
                        // Open Twitter
                        self.urlString = "https://www.twitter.com/BeanJuiceApp"
                        self.showSafari = true
                    }) {
                        Text("Twitter")
                    }
                    // summon the Safari sheet
                    .sheet(isPresented: $showSafari) {
                        SafariView(url: URL(string: self.urlString)!)
                    }
                })
                Text("App version: " + appVersion)
                    .font(.footnote)
                    .navigationBarTitle("Settings", displayMode: .inline)
            }
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

// struct Settings_Previews: PreviewProvider {
//     static var previews: some View {
//         SettingsView()
//     }
// }
