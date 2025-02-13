//
//  ClipboardManager.swift
//  Clipboard
//
//  Created by Abdelrahman Raafat on 8/7/24.
//

import AppKit
import Combine

class ClipboardManager: ObservableObject {
    private var lastChangeCount: Int = NSPasteboard.general.changeCount
    @Published var history: [String] = []

    func startMonitoring() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(checkClipboard), userInfo: nil, repeats: true)
    }

    @objc private func checkClipboard() {
        let pasteboard = NSPasteboard.general

        if pasteboard.changeCount != lastChangeCount {
            lastChangeCount = pasteboard.changeCount
            if let copiedString = pasteboard.string(forType: .string) {
                saveToHistory(copiedString)
            }
        }
    }

    private func saveToHistory(_ string: String) {
        // Remove any existing instance of the string
        if let index = history.firstIndex(of: string) {
            history.remove(at: index)
        }
        
        // Insert the new copy at the beginning of the history
        history.insert(string, at: 0)
    }

    func copyToClipboard(_ text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }

    func removeFromHistory(_ item: String) {
        if let index = history.firstIndex(of: item) {
            history.remove(at: index)
        }
    }

    func clearHistory() {
        history.removeAll()
    }
}

