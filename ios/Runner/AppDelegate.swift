import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let binaryMessenger = controller.engine.binaryMessenger
    BluetoothMethodsApiSetup.setUp(binaryMessenger: binaryMessenger, api: BluetoothManager(binaryMessenger: binaryMessenger) )
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
