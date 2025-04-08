//
//  CodecView.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/5/25.
//

import SwiftUI

enum Field: Hashable {
    case encodedText
    case decodedText
}

struct CodecView: View {
    @Binding var viewModel: ViewModel

    @FocusState private var focusedField: Field?

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Text(viewModel.title)

                Spacer()

                Button(action: {
                    let pasteboard = NSPasteboard.general
                    pasteboard.clearContents()
                    pasteboard.setString(viewModel.encoded, forType: .string)
                }) {
                    Image(systemName: "clipboard")
                }

                Button(role: .destructive, action: {
                    viewModel.encoded = ""
                }) {
                    Image(systemName: "clear")
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 12)

            ZStack {
                TextEditor(text: $viewModel.encoded)
                    .monospaced()
                    .focused($focusedField, equals: Field.encodedText)

                Text("Enter text to decode here")
                    .foregroundStyle(.secondary)
                    .opacity(viewModel.encoded.isEmpty ? 1 : 0)
            }

            HStack {
                HStack {
                    Button(action: {
                        viewModel.decode()
                    }) {
                        Text("↓ Decode")
                    }

                    Button(action: {
                        viewModel.encode()
                    }) {
                        Text("Encode ↑")
                    }

                    Button(action: {
                        viewModel.clearAll()
                    }) {
                        Text("Clear All")
                    }
                }
                .buttonStyle(AccessoryBarActionButtonStyle())
                .padding(.leading, 12)
                .padding(.vertical, 2)

                Spacer()

                HStack {
                    Button(action: {
                        let pasteboard = NSPasteboard.general
                        pasteboard.clearContents()
                        pasteboard.setString(viewModel.decoded, forType: .string)
                    }) {
                        Image(systemName: "clipboard")
                    }

                    Button(role: .destructive, action: {
                        viewModel.decoded = ""
                    }) {
                        Image(systemName: "clear")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 12)
            }

            TextEditor(text: $viewModel.decoded)
                .monospaced()
        }
        .onAppear {
            focusedField = .encodedText
        }
    }
}

#Preview {
    @Previewable @State var viewModel: ViewModel = Base64ViewModel()
    CodecView(viewModel: $viewModel)
}
