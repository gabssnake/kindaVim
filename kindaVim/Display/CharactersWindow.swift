import AppKit
import SwiftUI


struct CharactersWindow: WindowProtocol {
    
    var window: NSWindow
    static var lettersTyped = ""
    
    init() {
        window = NSWindow(
            contentRect: NSRect(),
            styleMask: [],
            backing: .buffered,
            defer: true
        )
        
        window.backgroundColor = .clear
        window.alphaValue = 0.7
        window.isMovableByWindowBackground = true
        window.level = .floating
        window.animationBehavior = .utilityWindow
        window.collectionBehavior = [.canJoinAllSpaces, .transient]
    }
    
    
    func show(lastCharacterBeing character: Character) {
        if mainWindowIsInFullScreenMode() {
            guard let mainWindowInfo = mainWindowInfo() else { return }
            guard let screen = screenOfMainWindowInFullScreenMode(using: mainWindowInfo) else { return }
            
            window.setFrame(NSRect(x: screen.frame.origin.x + 50, y: screen.frame.origin.y + 80, width: 269, height: 60), display: true)
        } else {
            guard let screen = NSScreen.main else { return }
            
            window.setFrame(NSRect(x: screen.frame.origin.x + 50, y: screen.frame.origin.y + 80, width: 269, height: 60), display: true)
        }
       
        if Self.lettersTyped.count > 10 {
            Self.lettersTyped = ""
        }
        
        Self.lettersTyped.append(character)
        
        window.contentView = NSHostingView(rootView: CharactersView(lettersTyped: Self.lettersTyped))
        window.orderFrontRegardless()
    }
    
    func hide() {
        Self.lettersTyped = ""
        
        Timer.scheduledTimer(
            withTimeInterval: 0.69,
            repeats: false,
            block: { _ in window.orderOut(self )}
        )
    }
    
}