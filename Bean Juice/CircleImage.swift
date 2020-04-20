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
    
    let methodName: String
    
    var body: some View {
        Image(methodName + "-Big")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 250, height: 250, alignment: .center)
        .clipShape(Circle())
        .shadow(radius: 5)
    }
}
