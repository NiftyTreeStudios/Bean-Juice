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
    
    var cupSizes = [
        CupSize(name: "Small", sizeMl: 118, sizeOz: 4),
        CupSize(name: "Medium", sizeMl: 177, sizeOz: 6),
        CupSize(name: "Large", sizeMl: 236, sizeOz: 8),
        CupSize(name: "X-Large", sizeMl: 355, sizeOz: 12),
        CupSize(name: "Bucket", sizeMl: 473, sizeOz: 16)
    ]
    
    var colors = [
        ColorData(name: "Blue", color: Color.blue),
        ColorData(name: "Green", color: Color.green),
        ColorData(name: "Orange", color: Color.orange),
        ColorData(name: "Pink", color: Color.pink),
        ColorData(name: "Purple", color: Color.purple),
        ColorData(name: "Red", color: Color.red),
        ColorData(name: "Yellow", color: Color.yellow)
    ]
    
    @ObservedObject var userDefaultsManager = UserDefaultsManager()
    
    // TODO: Make persistent between sessions
    @State private var selectedCup: Int = 1
    @Binding var cupSize: Double
    
    // TODO: Make persistent between sessions
    @State private var selectedColor: Int = 0
    @Binding var customColor: Color
    
    @State var showSafari = false
    @State var urlString = "https://duckduckgo.com"
    
    var body: some View {
        let cupSelection = Binding<Int>(get: {
            return self.selectedCup
        }, set: {
            self.selectedCup = $0
            self.cupSize = Double(self.cupSizes[$0].sizeMl)
        })
        
        let colorSelection = Binding<Int>(get: {
            return self.selectedColor
        }, set: {
            self.selectedColor = $0
            self.customColor = self.colors[$0].color
        })
        
        return NavigationView {
            Form {
                Section(header: Text("Use ml instead of cups")) {
                    Toggle(isOn: self.$userDefaultsManager.mlSelected) {
                        Text("Use ml")
                    }
                }
                //TODO: Make selected cup persistent between sessions.
                Section(header: Text("Cup size")
                    .font(.subheadline), footer: Text("Picked size: "  + "\(self.cupSizes[selectedCup].sizeMl) ml. or "  + "\(self.cupSizes[selectedCup].sizeOz) oz.")) {
                    Picker("Cup size", selection: cupSelection) {
                        ForEach(0 ..< cupSizes.count, id: \.self) {
                            Text(self.cupSizes[$0].name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                //TODO: Make color selection persistent between sessions.
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
                        SKStoreReviewController.requestReview()
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
                        SafariView(url:URL(string: self.urlString)!)
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
                        SafariView(url:URL(string: self.urlString)!)
                    }
                })
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
//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
