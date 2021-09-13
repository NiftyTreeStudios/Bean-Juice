//
//  MethodSelectionView.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 11.5.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import SwiftUI

struct MethodSelectionView: View {

    @StateObject private var viewModel = MethodSelectionViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.brewMethods, id: \.name) { brewMethod in
                    ItemRowView(method: brewMethod)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Brewing methods")
        }
    }
}
