//
//  InformationScreen.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 10.07.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import Models
import NiftyMarkdownFormatter

struct InformationScreen: View {
    // The method this information screen is shown for.
    let methodName: MethodName

    var body: some View {

        let method = getMethodName(method: methodName)
        let stringInformation = markdownString(method: method)
        let formattedMarkdown = NiftyMarkdownFormatter.formattedMarkdownArray(markdown: stringInformation)
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<formattedMarkdown.count, id: \.self) { item in
                    formattedMarkdown[item]
                }
                .padding()
            }
        }.navigationTitle(Text(method))
    }
}

func markdownString(method: String) -> String {
    guard let filepath = Bundle.main.url(forResource: method, withExtension: "md") else {
        return "Filepath not found"
    }
    let info = (try? String(contentsOf: filepath)) ?? "Nothing found"
    return info
}
