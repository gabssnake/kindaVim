import SwiftUI

class AppComponent {
    var statusBarController: StatusBarController!
    var vimEngine: KindaVimEngine!

    var accessibilityElementAdaptorTestingWindow: NSWindow!

    func setUp() {
        setUpWindowsState()
        setUpStatusBar()
        #if !CITESTING
        setUpEventTap()
        #endif
        setUpVimEngine()
    }

    private func setUpWindowsState() {
        NSApplication.shared.hide(self)

        #if UITESTING
        NSApplication.shared.setActivationPolicy(.regular)
        NSApplication.shared.activate(ignoringOtherApps: true)
        
        let contentView = ContentView()

        accessibilityElementAdaptorTestingWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 680, height: 400),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        accessibilityElementAdaptorTestingWindow.center()
        accessibilityElementAdaptorTestingWindow.contentView = NSHostingView(rootView: contentView)
        accessibilityElementAdaptorTestingWindow.makeKeyAndOrderFront(nil)
        #endif
    }

    private func setUpStatusBar() {
        statusBarController = StatusBarController()
    }

    private func setUpEventTap() {
        _ = EventTapController()
    }

    private func setUpVimEngine() {
        vimEngine = KindaVimEngine.shared
    }

}
