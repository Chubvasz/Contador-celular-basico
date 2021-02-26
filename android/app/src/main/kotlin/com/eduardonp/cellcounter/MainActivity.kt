package com.eduardonp.cellcounter

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Vibrator

class MainActivity: FlutterActivity() {
  private val CHANNEL = "cellcounter.eduardo.com/buttonaction"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->

      if (call.method == "buttonAction" ) {
        val name = call.arguments as String
        result.success(buttonAction(name))
      }
      // Note: this method is invoked on the main thread.
      // TODO
    }
  }

  private fun buttonAction (name : String?): String {
     // Vibrate for 400 milliseconds 
    val vibrator = getSystemService(VIBRATOR_SERVICE) as Vibrator?
    vibrator?.vibrate(150)
    return "true"
  }
}
