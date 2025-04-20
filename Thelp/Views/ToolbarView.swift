//
//  ToolbarView.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/19/25.
//

import SwiftUI

struct ToolbarView: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Button(action: {
                guard !text.isEmpty else { return }

                let pasteboard = NSPasteboard.general
                pasteboard.clearContents()
                pasteboard.setString(text, forType: .string)
            }) {
                Image(systemName: "clipboard")
            }

            Button(role: .destructive, action: {
                text = ""
            }) {
                Image(systemName: "trash")
            }
            .foregroundStyle(Color(.appRed))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ToolbarView(text: .constant(""))
        .frame(width: 50, height: 50)
}
