//
//  CircleImage.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.4.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleImage: View {

    @Namespace var namespace
    @State var imageTapped = false
    @State var seconds = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    let methodName: String
    var isRecipeView: Bool = false
    @State var brewTime: Int = 0

    var body: some View {
        ZStack {
            if imageTapped {
                Image(decorative: methodName + "-Big")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .blur(radius: 5)
                    .matchedGeometryEffect(id: "CircleImage", in: namespace)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 170.0, height: 100.0)
                                .foregroundColor(.background)
                                .blur(radius: 60)
                            if isRecipeView {
                                Text("\(formattedTime(time: secondsToHoursMinutesSeconds(seconds: brewTime)))")
                                    .font(.largeTitle)
                                    .onReceive(timer) { _ in
                                        brewTime -= 1
                                        if brewTime <= 0 {
                                            brewTime = 0
                                        }
                                    }
                            } else {
                                Text("\(formattedTime(time: secondsToHoursMinutesSeconds(seconds: seconds)))")
                                    .font(.largeTitle)
                                    .onReceive(timer) { _ in
                                        seconds += 1
                                        if seconds > 3600 {
                                            seconds = 0
                                        }
                                    }
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                Image(decorative: methodName + "-Big")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: "CircleImage", in: namespace)
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 10)
        .onTapGesture(perform: {
            seconds = 0
            withAnimation(.easeInOut(duration: 1)) {imageTapped.toggle()}
        })
        .padding(.top, -20)
    }
}
