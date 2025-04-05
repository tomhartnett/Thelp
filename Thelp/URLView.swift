//
//  URLView.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/4/25.
//

import SwiftUI

struct URLView: View {
    @State var encoded = ""
    @State var decoded = ""

    var body: some View {
        VStack {
            TextEditor(text: $encoded)
                .monospaced()

            HStack {
                Button(action: {
                    decoded = encoded.removingPercentEncoding ?? ""
                }) {
                    Text("↓ Decode")
                }

                Button(action: {
                    encoded = ""
                    decoded = ""
                }) {
                    Text("Clear")
                }

                Button(action: {
                    let allowedCharacters = CharacterSet.urlQueryAllowed
                        .union(.urlPathAllowed)
                        .union(.urlHostAllowed)
                        .union(.urlFragmentAllowed)
                        .union(.urlUserAllowed)
                        .union(.urlPasswordAllowed)

                    encoded = decoded.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? ""
                }) {
                    Text("Encode ↑")
                }
            }

            TextEditor(text: $decoded)
                .monospaced()
        }
    }
}

#Preview {
    URLView()
}
