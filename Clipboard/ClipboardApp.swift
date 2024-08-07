//
//  ClipboardApp.swift
//  Clipboard
//
//  Created by Abdelrahman Raafat on 8/7/24.
//

import SwiftUI

@main
struct ClipboardApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView(clipboardManager: appDelegate.clipboardManager)
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var clipboardManager: ClipboardManager = ClipboardManager()

    func applicationDidFinishLaunching(_ notification: Notification) {
        clipboardManager.startMonitoring()
    }
}


//@main
//struct ClipboardApp: App {
//    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
//class AppDelegate: NSObject, NSApplicationDelegate {
//    var clipboardManager: ClipboardManager?
//
//    func applicationDidFinishLaunching(_ notification: Notification) {
//        clipboardManager = ClipboardManager()
//        clipboardManager?.startMonitoring()
//    }
//}
