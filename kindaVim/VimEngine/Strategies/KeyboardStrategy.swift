//
//  KeyboardStrategy.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

import Foundation

struct KeyboardStrategy {
    
    static var proxy: CGEventTapProxy!

    static func a() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .both)
        ]
    }

    static func A() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both)
        ]
    }

    static func b() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    static func C() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, shift: true, command: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    static func cc() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .left, shift: true, command: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    static func ciw() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, shift: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    static func dd() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            // Emacs moves don't work in Xcode, so can't use
            // control + a
            // hence
            // double command left
            // dumb but hey
            KeyCombination(key: .left, shift: true, command: true, action: .both),
            KeyCombination(key: .left, shift: true, command: true, action: .both),
            KeyCombination(key: .delete, action: .both),
            KeyCombination(key: .down, action: .both),
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .delete, action: .both),
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    static func G() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, command: true, action: .both)
        ]
    }

    static func gg() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, command: true, action: .both)
        ]
    }

    static func h() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, action: .both)
        ]
    }

    static func I() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .both)
        ]
    }

    static func j() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, action: .both)
        ]
    }
    
    static func k() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, action: .both)
        ]
    }
    
    static func l() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .both)
        ]
    }

    static func o() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .enter, action: .both)
        ]
    }
    
    static func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .both),
            KeyCombination(key: .enter, action: .both),
            KeyCombination(key: .up, action: .both)
        ]
    }

    static func controlR() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, shift: true, command: true, action: .both)
        ]
    }
    
    static func u() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true, action: .both)
        ]
    }

    static func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    static func x() -> [KeyCombination] {
        // using right and delete because maskSecondaryFn does not seem
        // to work when posting CGEvents. will fill a Radar bug with Apple
        return [
            KeyCombination(key: .right, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }
    
    static func X() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete, action: .both)
        ]
    }

    static func dollarSign() -> [KeyCombination] {
        return [
            // Emacs moves don't work in Xcode, so can't use
            // control + e
            // hence
            // double command right
            // dumb but hey
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .right, command: true, action: .both)
        ]
    }

    static func underscore() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    static func zero() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .both)
        ]
    }

    static func post(_ keyCombinations: [KeyCombination]) -> Bool {
        print("move using Keyboard Strategy")
        
        for keyCombination in keyCombinations {
            let cgEvents = KeyCombinationAdaptor.toCGEvents(from: keyCombination)
            
            for cgEvent in cgEvents {
                cgEvent.tapPostEvent(proxy)
            }
        }
        
        return true
    }
    
}
