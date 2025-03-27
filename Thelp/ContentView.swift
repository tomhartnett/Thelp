//
//  ContentView.swift
//  Thelp
//
//  Created by Tom Hartnett on 3/27/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var encoded = ""
    @State var decoded = ""

    var body: some View {
        VStack {
            TextEditor(text: $encoded)

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
        }
        .padding()
    }

    func decode() {
        
    }

    func encode() {

    }
}

#Preview {
    ContentView()
}
