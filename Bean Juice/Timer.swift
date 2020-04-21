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
        ZStack() {
            Circle()
                .shadow(radius: 5)
                .colorInvert()
            Text("\(counter, specifier: "%.2f")")
                .onAppear(perform: {let _ = self.updateTimer})
        }
        .frame(width: 250, height: 250, alignment: .center)
        .clipShape(Circle())

    }
    
    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: { counter in
                                self.counter = self.counter + 0.01
                               })
    }
}
