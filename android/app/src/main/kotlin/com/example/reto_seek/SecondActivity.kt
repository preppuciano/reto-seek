package com.example.reto_seek
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.activity.ComponentActivity
import androidx.activity.enableEdgeToEdge
import androidx.camera.view.PreviewView
import androidx.core.content.ContextCompat
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import android.Manifest
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.common.InputImage

@androidx.camera.core.ExperimentalGetImage
class SecondActivity : ComponentActivity() {
    private lateinit var previewView: PreviewView
    private lateinit var cameraExecutor: ExecutorService

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_second)
        cameraExecutor = Executors.newSingleThreadExecutor()
        previewView = findViewById(R.id.previewView)
        requestPermissionLauncher.launch(Manifest.permission.CAMERA)
    }

    private fun handleClickPermission() {
        if (ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.CAMERA
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            Log.d("MainActivity", "PERMISSION_GRANTED")
            startCamera()
        } else {
            requestPermissionLauncher.launch(Manifest.permission.CAMERA)
        }
    }

    private val requestPermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted ->
        if (isGranted) {
            Log.d("MainActivity", "camera permission granted")
            startCamera()
        } else {
            Log.e("MainActivity", "camera permission denied")
            Toast.makeText(this, "Camera permission denied", Toast.LENGTH_SHORT).show()
        }
    }

    private inner class QRCodeAnalyzer : ImageAnalysis.Analyzer {
        override fun analyze(image: ImageProxy) {
            val mediaImage = image.image
            if (mediaImage != null) {
                val inputImage =
                    InputImage.fromMediaImage(mediaImage, image.imageInfo.rotationDegrees)
                val scanner = BarcodeScanning.getClient()

                scanner.process(inputImage)
                    .addOnSuccessListener { barcodes ->
                        for (barcode in barcodes) {
                            val value = barcode.displayValue
                            val resultIntent = Intent()
                            resultIntent.putExtra("result", value.toString())
                            setResult(RESULT_OK, resultIntent)
                            finish()
                        }
                    }
                    .addOnFailureListener {
                        Log.e("QRCodeAnalyzer", "Error al procesar el código QR", it)
                    }
                    .addOnCompleteListener {
                        image.close() // Cerrar el análisis de imagen
                    }
            }
        }
    }

    private fun startCamera() {
        val cameraProviderFuture = ProcessCameraProvider.getInstance(this)
        cameraProviderFuture.addListener({
            val cameraProvider = cameraProviderFuture.get()
            val preview = Preview.Builder().build()
            val cameraSelector = CameraSelector.Builder()
                .requireLensFacing(CameraSelector.LENS_FACING_BACK)
                .build()
            val imageAnalysis = ImageAnalysis.Builder()
                .build()
                .apply {
                    setAnalyzer(cameraExecutor, QRCodeAnalyzer())
                }
            cameraProvider.unbindAll()
            cameraProvider.bindToLifecycle(this, cameraSelector, preview, imageAnalysis)
            preview.surfaceProvider = previewView.surfaceProvider

        }, ContextCompat.getMainExecutor(this))
    }

    override fun onDestroy() {
        super.onDestroy()
        cameraExecutor.shutdown() // Limpiar el hilo del ejecutor
    }
}
