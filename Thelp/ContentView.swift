//
//  ContentView.swift
//  Thelp
//
//  Created by Tom Hartnett on 3/27/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Tab(
                    content: { URLView() },
                    label: { Text("URLs") }
                )
                Tab(
                    content: { Base64View() },
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
