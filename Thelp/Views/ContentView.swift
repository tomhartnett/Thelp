//
//  ContentView.swift
//  Thelp
//
//  Created by Tom Hartnett on 3/27/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var base64ViewModel: ViewModel = Base64ViewModel()
    @State private var urlViewModel: ViewModel = URLViewModel()

    var body: some View {
        VStack {
            TabView {
                Tab(
                    content: { CodecView(viewModel: $urlViewModel) },
                    label: { Text("URLs") }
                )
                Tab(
                    content: { CodecView(viewModel: $base64ViewModel) },
                    label: { Text("Base64") }
                )
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
