//
//  JSONView.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/20/25.
//

import Foundation
import SwiftUI

struct JSONView: View {
    @State private var text = ""

    @State private var errorMessage = ""

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Button(action: {
                    formatText()
                }) {
                    Text("Format")
                }
                .buttonStyle(AccessoryBarActionButtonStyle())

                Text(errorMessage)
                    .foregroundStyle(Color(.appRed))

                Spacer()

                ToolbarView(text: $text)
            }
            .padding(.trailing, 12)

            ZStack {
                InputTextView(text: $text)
                    .focused($isFocused)

                Text("Enter JSON to format")
                    .foregroundStyle(.secondary)
                    .opacity(text.isEmpty ? 1 : 0)
            }
        }
        .onAppear {
            isFocused = true
        }
        .onChange(of: text) { _, _ in
            errorMessage = ""
        }
    }

    func formatText() {
        guard let data = text.data(using: .utf8),
              let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
            errorMessage = "Failed to parse JSON"
            return
        }

        guard let formattedData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
              let formattedText = String(data: formattedData, encoding: .utf8) else {
            errorMessage = "Failed to format JSON"
            return
        }

        text = formattedText
    }
}

#Preview {
    JSONView()
}
