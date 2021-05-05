//
//  KeyboardStrategy.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

import Foundation

protocol KeyboardStrategyProtocol {

    func a() -> [KeyCombination]
    func A() -> [KeyCombination]
    func b() -> [KeyCombination]
    func C() -> [KeyCombination]
    func cc() -> [KeyCombination]
    func ciw() -> [KeyCombination]
    func dd() -> [KeyCombination]
    func G() -> [KeyCombination]
    func gg() -> [KeyCombination]
    func h() -> [KeyCombination]
    func I() -> [KeyCombination]
    func j() -> [KeyCombination]
    func k() -> [KeyCombination]
    func l() -> [KeyCombination]
    func o() -> [KeyCombination]
    func O() -> [KeyCombination]
    func controlR() -> [KeyCombination]
    func u() -> [KeyCombination]
    func w() -> [KeyCombination]
    func x() -> [KeyCombination]
    func X() -> [KeyCombination]
    func dollarSign() -> [KeyCombination]
    func underscore() -> [KeyCombination]
    func zero() -> [KeyCombination]

}

struct KeyboardStrategy: KeyboardStrategyProtocol {
    
    static var proxy: CGEventTapProxy!

    func a() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .both)
        ]
    }

    func A() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both)
        ]
    }

    func b() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    func C() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, shift: true, command: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    func cc() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .left, shift: true, command: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    func ciw() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, shift: true, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }

    func dd() -> [KeyCombination] {
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

    func G() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, command: true, action: .both)
        ]
    }

    func gg() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, command: true, action: .both)
        ]
    }

    func h() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, action: .both)
        ]
    }

    func I() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .both)
        ]
    }

    func j() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, action: .both)
        ]
    }
    
    func k() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, action: .both)
        ]
    }
    
    func l() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, action: .both)
        ]
    }

    func o() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true, action: .both),
            KeyCombination(key: .enter, action: .both)
        ]
    }
    
    func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true, action: .both),
            KeyCombination(key: .enter, action: .both),
            KeyCombination(key: .up, action: .both)
        ]
    }

    func controlR() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, shift: true, command: true, action: .both)
        ]
    }
    
    func u() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true, action: .both)
        ]
    }

    func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    func x() -> [KeyCombination] {
        // using right and delete because maskSecondaryFn does not seem
        // to work when posting CGEvents. will fill a Radar bug with Apple
        return [
            KeyCombination(key: .right, action: .both),
            KeyCombination(key: .delete, action: .both)
        ]
    }
    
    func X() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete, action: .both)
        ]
    }

    func dollarSign() -> [KeyCombination] {
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

    func underscore() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .both),
            KeyCombination(key: .right, option: true, action: .both),
            KeyCombination(key: .left, option: true, action: .both)
        ]
    }

    func zero() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true, action: .both)
        ]
    }

    static func post(_ keyCombinations: [KeyCombination]) {
        print("move using Keyboard Strategy")
        
        for keyCombination in keyCombinations {
            let cgEvents = KeyCombinationAdaptor.toCGEvents(from: keyCombination)
            
            for cgEvent in cgEvents {
                cgEvent.tapPostEvent(proxy)
            }
        }
    }
    
}
