//
//  ItemRowView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    let method: Method

    var body: some View {

        NavigationLink(
            destination: MethodView(method: method)
        ) {
                HStack {
                    Image(getMethodName(method: method.name) + "-Big")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60, alignment: .center)
                        .clipShape(Circle())
                    Text(getMethodName(method: method.name))
                        .font(.title2)
                }
        }
    }
}
