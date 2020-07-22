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
    @State private var isSelectedColorWhite: Bool = false

    
    var body: some View {
        HStack {
            Text("Cups")
                .foregroundColor(mlSelected ? .gray : customColor)
            Toggle("Cup Switch", isOn: $mlSelected)
                .toggleStyle(CustomToggleStyle(customColor: $customColor, isSelectedColorWhite: $isSelectedColorWhite))
                .onAppear   {
                    if self.customColor == .white {
                        self.isSelectedColorWhite = true
                    } else {
                        self.isSelectedColorWhite = false
                    }
                }
            Text("ml")
                .foregroundColor(mlSelected ? customColor : .gray)
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    
    @Binding var customColor: Color
    @Binding var isSelectedColorWhite: Bool
    
    let width: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {

        HStack {

            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: width, height: width / 2)
                    .foregroundColor(customColor)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: (width / 2) - 4, height: width / 2 - 6)
                    .padding(4)
                    .foregroundColor(isSelectedColorWhite ? .black : .white)
                    .onTapGesture {
                        configuration.$isOn.wrappedValue.toggle()
                }
            }
        }
    }
}
