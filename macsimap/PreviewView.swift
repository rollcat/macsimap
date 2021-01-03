import AVFoundation
import AVKit
import SwiftUI

import AppKit

struct PreviewView: NSViewRepresentable {
    private let captureSession: AVCaptureSession
    init(captureSession: AVCaptureSession) {
        self.captureSession = captureSession
    }
    func updateNSView(_ nsView: NSView, context: NSViewRepresentableContext<PreviewView>) {
    }
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        view.wantsLayer = true
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.session = captureSession
        view.layer = previewLayer
        return view
    }
}
