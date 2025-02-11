//
//  CafePin.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 02.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct CafePin: View {

    let cafe: Cafe

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.teal, .pink],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                )
            Image(uiImage: cafe.smallAsset.convertToUIImage())
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25)
                .background()
                .clipShape(Circle())
        }
    }
}

struct CafePin_Previews: PreviewProvider {
    static var previews: some View {
        CafePin(cafe: Cafe(record: MockData.cafe))
    }
}
