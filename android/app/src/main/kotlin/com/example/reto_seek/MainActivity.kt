package com.example.reto_seek

import android.content.Intent
import androidx.annotation.OptIn
import androidx.camera.core.ExperimentalGetImage
import com.qr_code_scanner_data.pigeon.FlutterError
import com.qr_code_scanner_data.pigeon.QRCodeScannerApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

typealias FlutterResultCallback = (Result<String>) -> Unit

class MainActivity : FlutterActivity(), QRCodeScannerApi {
    private val composeActivityRequestCode: Int = 100

    private var getResultCallback: FlutterResultCallback? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        QRCodeScannerApi.setUp(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (getResultCallback == null) return@onActivityResult

        if (requestCode == composeActivityRequestCode && resultCode == RESULT_OK) {
            val value = data?.getStringExtra("result")
            if (value == null) {
                getResultCallback?.invoke(
                    Result.failure(FlutterError("code", "message", "details"))
                )
                return@onActivityResult
            }
            getResultCallback?.invoke(Result.success(value))
        }
    }

    @OptIn(ExperimentalGetImage::class)
    override fun getData(callback: (Result<String>) -> Unit) {
        getResultCallback = callback
        val intent = Intent(this, SecondActivity::class.java)
        startActivityForResult(intent, composeActivityRequestCode)
    }
}
