//
//  CustomToggle.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 22.7.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct CustomToggle: View {

    @Binding var mlSelected: Bool
    @Binding var customColor: Color

    var body: some View {
        HStack {
            Text("Cups")
                .foregroundColor(mlSelected ? .gray : customColor)
            Toggle("Cup Switch", isOn: $mlSelected)
                .toggleStyle(CustomToggleStyle(customColor: $customColor))
            Text("ml")
                .foregroundColor(mlSelected ? customColor : .gray)
        }
    }
}

struct CustomToggleStyle: ToggleStyle {

    @Binding var customColor: Color

    let width: CGFloat = 50

    func makeBody(configuration: Self.Configuration) -> some View {

        HStack {

            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                // RoundedRectangle(cornerRadius: 4)
                    Capsule()
                        .frame(width: width, height: width / 1.9)
                    .foregroundColor(customColor)

                // RoundedRectangle(cornerRadius: 4)
                    Capsule()
                        .frame(width: (width / 2) - 4, height: width / 1.9 - 6)
                    .padding(4)
                    .foregroundColor(.white)
                    .onTapGesture {
                        configuration.$isOn.wrappedValue.toggle()
                }
            }
        }
    }
}
