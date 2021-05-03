//
//  GlobalEventsController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 25/04/2021.
//

import Foundation

struct GlobalEventsController {
    
    static func handle(_ keyCombination: KeyCombination?) -> Bool {
        if VimEngineController.shared.currentMode != .insert {
            guard let implementedKeyCombination = keyCombination else { return true }

            return VimEngineController.shared.transform(from: implementedKeyCombination)
        }

        guard let implementedKeyCombination = keyCombination else { return false }

        if globalVimEngineHotkeyIsPressed(implementedKeyCombination) {
            VimEngineController.shared.enterCommandMode()
            
            print("enter command mode")
            
            return true
        }

        return false
    }
    
    private static func globalVimEngineHotkeyIsPressed(_ keyCombination: KeyCombination) -> Bool {
        return keyCombination.key == .escape && keyCombination.command == true
    }
    
}
