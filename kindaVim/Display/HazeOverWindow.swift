import AppKit

struct HazeOverWindow {
    
    var window: NSWindow
    
    init() {
        window = NSWindow(
            contentRect: NSRect(),
            styleMask: [],
            backing: .buffered,
            defer: true
        )
        
        window.backgroundColor = .black
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
    }
    
    
    func on() {
        guard let screen = NSScreen.main else { return }
        window.setFrameOrigin(screen.visibleFrame.origin)
        window.setFrame(NSRect(x: 0, y: 0, width: screen.frame.width, height: screen.frame.height), display: true)
        window.alphaValue = mainWindowIsInFullScreenMode() ? 0.2 : 0.8
        
        let mainWindowNumber = self.mainWindowNumber() ?? -6969
        window.order(.below, relativeTo: mainWindowNumber)
    }
  
    private func mainWindowIsInFullScreenMode() -> Bool {
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly], kCGNullWindowID) as NSArray? else { return false }
        guard let isInFullScreenMode = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerName = \"Dock\" AND kCGWindowStoreType = 2")).first as? NSDictionary else { return false }
        
        print(isInFullScreenMode.count)
        
        return isInFullScreenMode.count == 0 ? false : true
    }
    
    private func mainWindowNumber() -> Int? {
        guard let pid = NSWorkspace.shared.frontmostApplication?.processIdentifier else { return nil }
        guard let tooManyWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as NSArray? else { return nil }
        guard let mainWindowData = tooManyWindows.filtered(using: NSPredicate(format: "kCGWindowOwnerPID = \(pid)")).first as? NSDictionary else { return nil } 
        
        return mainWindowData.value(forKey: "kCGWindowNumber") as? Int
    }
    
    func off() {
        window.orderOut(self)
    }
    
}
