import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
        let binaryMessenger = controller.engine.binaryMessenger
        BluetoothMethodsApiSetup.setUp(binaryMessenger: binaryMessenger, api: BluetoothManager(binaryMessenger: binaryMessenger) )
    }
}
