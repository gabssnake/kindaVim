@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts
import Sauce
import SwiftUI


class GCECustomKeyboardShortcutTests: XCTestCase {
    
    var useCustomShortcutToEnterNormalModeProductionValue: Bool!
    var globalHotkeyCombination: KeyCombination!
    
    override func setUp() {
        useCustomShortcutToEnterNormalModeProductionValue = GlobalEventsController.useCustomShortcutToEnterNormalMode
        GlobalEventsController.useCustomShortcutToEnterNormalMode = true
        
        guard let customKeyboardShortcut = KeyboardShortcuts.getShortcut(for: .enterNormalMode) else { return XCTFail() }
        guard let key = Sauce.shared.key(for: customKeyboardShortcut.key!.rawValue) else { return XCTFail() }
        
        globalHotkeyCombination = KeyCombination(
            key: key,
            control: customKeyboardShortcut.modifiers.contains(.control),
            option: customKeyboardShortcut.modifiers.contains(.option),
            shift: customKeyboardShortcut.modifiers.contains(.shift),
            command: customKeyboardShortcut.modifiers.contains(.command)
        )

    }
    
    override func tearDown() {
        GlobalEventsController.useCustomShortcutToEnterNormalMode = useCustomShortcutToEnterNormalModeProductionValue
    }
    
}


// Insert Mode
extension GCECustomKeyboardShortcutTests {
    
    func test_that_when_in_InsertMode_the_global_hotkey_press_sets_Vim_in_NormalMode() {
        AppCore.shared.vimEngine.enterInsertMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .normal)
    }

    func test_that_when_in_InsertMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
}


// Normal Mode
extension GCECustomKeyboardShortcutTests {
    
    func test_that_when_in_NormalMode_the_global_hotkey_press_stays_in_NormalMode() {
        AppCore.shared.vimEngine.enterNormalMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .normal)
    }

    func test_that_when_in_NormalMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterNormalMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
        
}


// Visual Mode
extension GCECustomKeyboardShortcutTests {
    
    func test_that_when_in_VisualMode_the_global_hotkey_press_stays_in_VisualMode() {
        AppCore.shared.vimEngine.enterVisualMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.currentMode, .visual)
    }
    
    func test_that_when_in_VisualMode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterVisualMode()
        
        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)
        
        XCTAssertTrue(captured)
    }

}
