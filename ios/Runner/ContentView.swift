//
//  ContentView.swift
//  Runner
//
//  Created by Luciano Larama on 11-03-25.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var text: String = "Texto desde SwiftUI"
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan QR code"
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    self.text = code.string;
                    NotificationCenter.default.post(name: .dataReceivedNotification, object: scannedCode)
                }
            }
        )
    }
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            Button("SCAN"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
        .padding()
        .onAppear(){
            self.isPresentingScanner = true
        }
    }
}



extension Notification.Name {
    static let dataReceivedNotification = Notification.Name("dataReceivedNotification")
}
