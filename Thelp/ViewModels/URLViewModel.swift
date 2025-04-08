//
//  URLViewModel.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/5/25.
//

import Foundation

@Observable
class URLViewModel: ViewModel {
    var encoded = ""

    var decoded = ""

    let title = "URL Encoder & Decoder"

    func clearAll() {
        encoded = ""
        decoded = ""
    }

    func decode() {
        decoded = encoded.removingPercentEncoding ?? ""
    }

    func encode() {
        let allowedCharacters = CharacterSet.urlQueryAllowed
            .union(.urlPathAllowed)
            .union(.urlHostAllowed)
            .union(.urlFragmentAllowed)
            .union(.urlUserAllowed)
            .union(.urlPasswordAllowed)

        encoded = decoded.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? ""
    }
}
