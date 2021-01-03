import SwiftUI
import AVKit

struct ContentView: View {
    let captureSession: AVCaptureSession!
    init(captureSession: AVCaptureSession) {
        self.captureSession = captureSession
    }
    var body: some View {
        return PreviewView(captureSession: self.captureSession)
    }
}
