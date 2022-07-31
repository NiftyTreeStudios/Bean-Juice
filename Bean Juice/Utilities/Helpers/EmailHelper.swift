//
//  EmailHelper.swift
//  Bean Juice
//
//  Created by Iiro Alhonen on 02.12.21.
//  Copyright © 2021 Nifty Tree Studios. All rights reserved.
//

import MessageUI

final class EmailHelper {

    func sendEmail(email: String, content: String) {

        var emailTemplate: URL?
        let fullEmailTemplate = "mailto:\(email)?\(content)"
        let noContentEmailTemplate = "mailto:\(email)"

        print(fullEmailTemplate.isValidURL)

        if let fullEmail = URL(string: fullEmailTemplate) {
            emailTemplate = fullEmail
        } else if let justEmail = URL(string: noContentEmailTemplate) {
            emailTemplate = justEmail
        }

        guard let emailTemplate = emailTemplate else { return }
        #if targetEnvironment(simulator)
            return
        #else
            UIApplication.shared.open(emailTemplate)
        #endif
    }
}

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
