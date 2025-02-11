//
//  SocialMedia.swift
//  SocialMedia
//
//  Created by Iiro Alhonen on 08.09.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import SafariServices

struct SocialMedia: View {

    @State var showSafari = false

    var body: some View {
        var urlString = "https://duckduckgo.com"

        Section(header: Text("Follow us on Instagram"), footer: Text("@BeanJuiceApp"), content: {
            Button {
                urlString = "https://www.instagram.com/BeanJuiceApp"
                self.showSafari = true
            } label: {
                Text("Instagram")
            }
            .sheet(isPresented: $showSafari) {
                SafariView(url: URL(string: urlString)!)
            }
        })
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(
        _ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<SafariView>
    ) { }
}

struct SocialMedia_Previews: PreviewProvider {
    static var previews: some View {
        SocialMedia()
    }
}
