package com.example.csv_reader

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {


    private val CHANNEL = "intent.open.file"


    @Override
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getFilePath") {
                if (intent.data != null) {
                    val path = FileUtils.openFileStream(this, intent.data, false).path
                    result.success(path)
                } else
                    result.success(null)


            }

        }
    }
}
