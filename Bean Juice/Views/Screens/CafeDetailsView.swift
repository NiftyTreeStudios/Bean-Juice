//
//  CafeDetailsView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 30.11.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import MapKit

struct CafeDetailsView: View {

    let cafe: Cafe

    var body: some View {
        ScrollView {
            Image(uiImage: cafe.bigAsset.convertToUIImage())
                .resizable()
                .scaledToFill()
            VStack {
                // Basic info
                Text(cafe.name)
                    .font(.title)
                    .multilineTextAlignment(.center)

                if let websiteURL = URL(string: cafe.websiteURL) {
                    Link(cafe.websiteURL, destination: websiteURL)
                }

                // Description
                Divider()
                Text(cafe.description)

                // Address
                Divider()
                Text(cafe.streetAddress)
                Text("\(cafe.postalCode) \(cafe.city)")
                Text("\(cafe.state) \(cafe.country)")
            }.padding()
        }
    }
}

struct CafeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CafeDetailsView(cafe: Cafe(record: MockData.cafe))
    }
}
