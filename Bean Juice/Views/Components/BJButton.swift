//
//  CustomButton.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 03.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct BJButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 150, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
