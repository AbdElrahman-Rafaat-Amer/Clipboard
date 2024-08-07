//
//  ContentView.swift
//  Clipboard
//
//  Created by Abdelrahman Raafat on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var clipboardManager: ClipboardManager

    var body: some View {
        VStack {
            // Header with clear all button
            HStack {
                Text("Clipboard History")
                    .font(.headline)
                    .padding()

                Spacer()

                Button(action: {
                    clipboardManager.clearHistory()
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }

            List {
                ForEach(clipboardManager.history, id: \.self) { item in
                    HStack {
                        // Copy button
                        Button(action: {
                            clipboardManager.copyToClipboard(item)
                        }) {
                            Text(item)
                                .lineLimit(1)
                                .truncationMode(.tail)
                                .padding(5)
                        }
                        .buttonStyle(PlainButtonStyle())

                        Spacer()

                        // Remove button
                        Button(action: {
                            clipboardManager.removeFromHistory(item)
                        }) {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
        }
        .padding()
    }

    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = clipboardManager.history[index]
            clipboardManager.removeFromHistory(item)
        }
    }
}


//struct ContentView: View {
//    @ObservedObject var clipboardManager: ClipboardManager
//
//    var body: some View {
//        VStack {
//            Text("Clipboard History")
//                .font(.headline)
//                .padding()
//
//            List(clipboardManager.history, id: \.self) { item in
//                Button(action: {
//                    clipboardManager.copyToClipboard(item)
//                }) {
//                    Text(item)
//                        .lineLimit(1)
//                        .truncationMode(.tail)
//                        .padding(5)
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(5)
//                }
//                .buttonStyle(PlainButtonStyle()) // Removes default button styling
//            }
//            .listStyle(PlainListStyle()) // To make it look more like a list and less like a form
//        }
//        .padding()
//    }
//}

