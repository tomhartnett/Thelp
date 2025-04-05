//
//  Base64ViewModel.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/5/25.
//

import Foundation

@Observable
class Base64ViewModel: ViewModel {
    var encoded = ""
    
    var decoded = ""

    func clearAll() {
        encoded = ""
        decoded = ""
    }

    func decode() {
        var encodedString = encoded
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")

        if encodedString.count % 4 != 0 {
            encodedString += String(repeating: "=", count: 4 - encodedString.count % 4)
        }

        if let data = Data(base64Encoded: encodedString),
           let string = String(data: data, encoding: .utf8) {
            decoded = string
        } else {
            decoded = "Failed to decode"
        }
    }

    func encode() {
        if let string = decoded.data(using: .utf8)?.base64EncodedString() {
            encoded = string
                .replacingOccurrences(of: "+", with: "-")
                .replacingOccurrences(of: "/", with: "_")

        } else {
            encoded = "Failed to encode"
        }
    }
}
