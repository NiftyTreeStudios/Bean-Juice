//
//  EmailCafeRecommendationsComponent.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 02.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import SwiftUI
import MessageUI

struct EmailCafeRecommendationsComponent: View {

    private let emailHelper = EmailHelper()

    @State private var alertItem: AlertItem?

    private let mailAddress = "cafe@niftytreestudios.com"

    private let mailTemplate = """
        subject=New%20cafe%20recommendation:%20\
        &body=Add%20the%20information%20below.%0A\
        Cafe%20name:%20%0A\
        Website:%20%0A\
        Description:%20%0A\
        Street%20address:%20%0A\
        Postal%20code:%20%0A\
        City:%20%0A\
        State:%20%0A\
        Country:%20%0A\
        I%20will%20check%20the%20information%20and%20add%20it%20to%20\
        the%20list%20if%20it%20looks%20like%20a%20good%20speciality%20cafe.%0A\
        %20Thanks%20for%20making%20Bean%20Juice%20better.%0A
        """

    var body: some View {
        Button {
            guard URL(string: mailAddress) != nil else {
                alertItem = AlertContext.emailGenerationFailed
                return
            }
            emailHelper.sendEmail(email: mailAddress, content: mailTemplate)
        } label: {
            Text("Send cafe recommendation")
        }
        .alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
    }
}

struct EmailCafeRecommendationsComponent_Previews: PreviewProvider {
    static var previews: some View {
        EmailCafeRecommendationsComponent()
    }
}
