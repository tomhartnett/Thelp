//
//  Base64View.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/4/25.
//

import SwiftUI

struct Base64View: View {
    @State var encoded = ""
    @State var decoded = ""

    var body: some View {
        VStack {
            TextEditor(text: $encoded)
                .monospaced()

            HStack {
                Button(action: {
                    var encodedString = encoded
                        .replacingOccurrences(of: "-", with: "+")
                        .replacingOccurrences(of: "_", with: "/")

                    if encodedString.count % 4 != 0 {
                        encodedString += String(repeating: "=", count: 4 - encoded.count % 4)
                    }

                    if let data = Data(base64Encoded: encodedString),
                       let string = String(data: data, encoding: .utf8) {
                        decoded = string
                    } else {
                        decoded = "Failed to decode"
                    }
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
                    if let string = decoded.data(using: .utf8)?.base64EncodedString() {
                        encoded = string
                            .replacingOccurrences(of: "+", with: "-")
                            .replacingOccurrences(of: "/", with: "_")
                            .replacingOccurrences(of: "=", with: "") // Remove padding
                    } else {
                        encoded = "Failed to encode"
                    }
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
    Base64View()
}
