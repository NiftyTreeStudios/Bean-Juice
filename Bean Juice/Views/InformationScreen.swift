//
//  InformationScreen.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 10.07.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct InformationScreen: View {
    // The method this information screen is shown for.
    let methodName: MethodName

    var body: some View {
        VStack {
            Text(getMethodName(method: methodName))
        }.navigationTitle(Text(getMethodName(method: methodName)))
    }
}

struct InformationScreen_Previews: PreviewProvider {
    static var previews: some View {
        InformationScreen(methodName: .coldBrew)
    }
}
