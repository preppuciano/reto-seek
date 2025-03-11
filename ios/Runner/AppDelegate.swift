import UIKit
import SwiftUI

@main
@objc class AppDelegate: FlutterAppDelegate, QRCodeScannerApi {
    var hostingController: UIHostingController<ContentView>?
    var flutterViewController: FlutterViewController!
    var storedCompletion: ((Result<String, Error>) -> Void)?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        flutterViewController = window?.rootViewController as? FlutterViewController
        QRCodeScannerApiSetup.setUp(binaryMessenger: flutterViewController.binaryMessenger, api: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    @objc func handleReceivedData(notification: Notification) {
        if let data = notification.object as? String {
            storedCompletion?(.success(data))
            DispatchQueue.main.async {
                self.window?.rootViewController = self.flutterViewController
                self.window?.makeKeyAndVisible()
            }
        }
    }
    
    func getData(completion: @escaping (Result<String, Error>) -> Void) {
        storedCompletion = completion
        
        let contentView = ContentView()
        hostingController = UIHostingController(rootView: contentView)
        
        DispatchQueue.main.async {
            self.window?.rootViewController = self.hostingController
            self.window?.makeKeyAndVisible()
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handleReceivedData(notification:)),
            name: .dataReceivedNotification,
            object: nil
        )
    }
}
