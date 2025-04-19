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
            .foregroundStyle(Color(red: 0.87, green: 0, blue: 0))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ToolbarView(text: .constant(""))
        .frame(width: 50, height: 50)
}
