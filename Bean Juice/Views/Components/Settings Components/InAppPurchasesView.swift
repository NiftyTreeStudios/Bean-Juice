//
//  InAppPurchasesView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 14.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import StoreKit

struct InAppPurchasesView: View {
    var body: some View {
        Section(header: Text("Support the development of Bean Juice")) {
            Button {
                
            } label: {
                Text("Give me tip")
            }

        }
    }
}

struct InAppPurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        InAppPurchasesView()
    }
}
