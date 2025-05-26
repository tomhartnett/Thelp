//
//  ToolbarView.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/19/25.
//

import SwiftUI

struct ToolbarView: View {
    @Binding var text: String

    @State private var copyButtonScale = 1.0

    @State private var trashButtonScale = 1.0

    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.bouncy) {
                    copyButtonScale *= 1.1
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.bouncy) {
                        copyButtonScale = 1.0
                    }
                }

                guard !text.isEmpty else { return }

                let pasteboard = NSPasteboard.general
                pasteboard.clearContents()
                pasteboard.setString(text, forType: .string)
            }) {
                Image(systemName: "clipboard")
            }
            .scaleEffect(copyButtonScale)
            .animation(.spring(duration: 0.25, bounce: 0.75), value: copyButtonScale)
            .opacity(copyButtonScale > 1 ? 0.5 : 1)

            Button(role: .destructive, action: {
                withAnimation(.bouncy) {
                    trashButtonScale *= 1.1
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.bouncy) {
                        trashButtonScale = 1.0
                    }
                }

                text = ""
            }) {
                Image(systemName: "trash")
            }
            .foregroundStyle(Color(.appRed))
            .scaleEffect(trashButtonScale)
            .animation(.spring(duration: 0.25, bounce: 0.75), value: trashButtonScale)
            .opacity(trashButtonScale > 1 ? 0.5 : 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ToolbarView(text: .constant(""))
        .frame(width: 50, height: 50)
}
