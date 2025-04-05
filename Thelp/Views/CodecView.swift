//
//  CodecView.swift
//  Thelp
//
//  Created by Tom Hartnett on 4/5/25.
//

import SwiftUI

struct CodecView: View {
    @Binding var viewModel: ViewModel

    var body: some View {
        VStack {
            TextEditor(text: $viewModel.encoded)
                .monospaced()

            HStack {
                Button(action: {
                    viewModel.decode()
                }) {
                    Text("↓ Decode")
                }

                Button(action: {
                    viewModel.clearAll()
                }) {
                    Text("Clear")
                }

                Button(action: {
                    viewModel.encode()
                }) {
                    Text("Encode ↑")
                }
            }

            TextEditor(text: $viewModel.decoded)
                .monospaced()
        }
    }
}

#Preview {
    @Previewable @State var viewModel: ViewModel = Base64ViewModel()
    CodecView(viewModel: $viewModel)
}
