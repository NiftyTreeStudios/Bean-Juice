//
//  SocialMedia.swift
//  SocialMedia
//
//  Created by Iiro Alhonen on 08.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct SocialMedia: View {

    @State var showSafari = false

    var body: some View {
        var urlString = "https://duckduckgo.com"

        Section(header: Text("Follow us on social media")
                    .font(.subheadline), footer: Text("@BeanJuiceApp"), content: {
            Button(action: {
                // Open Instagram
                urlString = "https://www.instagram.com/BeanJuiceApp"
                self.showSafari = true
            }) {
                Text("Instagram")
            }
            Button(action: {
                // Open Twitter
                urlString = "https://www.twitter.com/BeanJuiceApp"
                self.showSafari = true
            }) {
                Text("Twitter")
            }
            .sheet(isPresented: $showSafari) {
                SafariView(url: URL(string: urlString)!)
            }
        })
    }
}

struct SocialMedia_Previews: PreviewProvider {
    static var previews: some View {
        SocialMedia()
    }
}