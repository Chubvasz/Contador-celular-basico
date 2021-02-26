import UIKit
import Flutter
import AudioToolbox

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let buttonChannel = FlutterMethodChannel(name: "cellcounter.eduardo.com/buttonaction",
                        binaryMessenger: controller.binaryMessenger)

    buttonChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

      if (call.method == "buttonAction") {
        self.buttonAction(name: call.arguments as! String, result: result)
      }
      // Note: this method is invoked on the UI thread.
      // Handle battery messages.
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func buttonAction(name: String, result: FlutterResult) {
    let response = "true"

    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)

    result(response)
  }
}
