//
//  Timer.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 20.4.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation
import SwiftUI

struct TimerView: View {
    
    @State private var counter: Double = 00.00
    
    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                Circle()
                    .fill(Color.gray)
                    .overlay(
                        Text("Reset")
                ).frame(width: 75, height: 75)
                    .padding([.trailing, .bottom], -30.0)

                Circle()
                    .colorInvert()
                    .overlay(VStack {
                        Text("Time")
        //                Clock(time: updateTimer)
        //                Text("\(counter, specifier: "%.2f")")
        //                    .onAppear(perform: {let _ = self.updateTimer})
                        }
                    )
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.primary, lineWidth: 5))
                
                Circle()
                    .fill(Color.green)
                    .overlay(
                        Text("Start")
                ).frame(width: 75, height: 75)
                    .padding([.leading, .bottom], -30.0)
            }
        }

    }
    
    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: { counter in
                                self.counter = self.counter + 0.01
                               })
    }
}
