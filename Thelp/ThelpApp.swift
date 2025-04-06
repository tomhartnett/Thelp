//
//  ThelpApp.swift
//  Thelp
//
//  Created by Tom Hartnett on 3/27/25.
//

import SwiftUI

@main
struct ThelpApp: App {
    @NSApplicationDelegateAdaptor private var appDelegate: ThelpAppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class ThelpAppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}
