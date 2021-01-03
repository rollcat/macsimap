import Cocoa
import SwiftUI
import AVFoundation

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func setupCapture() -> AVCaptureSession? {
        let session = AVCaptureSession()
        session.beginConfiguration()
        let cap = AVCaptureScreenInput()
        // Hardcoded coordinates for StarCraft II, very rough and slightly inaccurate.
        cap.cropRect = CGRect(x:35, y: 20, width:420, height:420)
        session.addInput(cap)
        session.commitConfiguration()
        return session
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let session = self.setupCapture() else { return }
        let contentView = ContentView(captureSession: session)
        session.startRunning()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }


}

