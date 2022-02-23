import SwiftUI


@main
struct kindaVimApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            SettingsView()
        }
        .commands {
            CommandMenu("File") {
                Button("Close") {
                    NSApp.sendAction(#selector(NSWindow.orderOut(_:)), to: nil, from: self)
                    NSApp.hide(self)
                }.keyboardShortcut("w")
            }
            CommandMenu("Edit") {
                Button("Cut") {
                    NSApp.sendAction(#selector(NSText.cut(_:)), to: nil, from: self)
                }.keyboardShortcut("x")
                Button("Copy") {
                    NSApp.sendAction(#selector(NSText.copy(_:)), to: nil, from: self)
                }.keyboardShortcut("c")
                Button("Paste") {
                    NSApp.sendAction(#selector(NSText.paste(_:)), to: nil, from: self)
                }.keyboardShortcut("v")
                Button("Select All") {
                    NSApp.sendAction(#selector(NSText.selectAll(_:)), to: nil, from: self)
                }.keyboardShortcut("a")
            }
        }
    }
    
}
