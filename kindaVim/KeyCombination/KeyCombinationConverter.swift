//
//  KeyCombinationConverter.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 26/04/2021.
//

import Foundation

struct KeyCombinationConverter {
    
    static func toCGEvents(from keyCombination: KeyCombination) -> [CGEvent] {
        var events = [CGEvent]()
        
        if keyCombination.action == .press || keyCombination.action == .both {
            if let pressedEvent = Self.toPressedCGEvent(from: keyCombination) {
                events.append(pressedEvent)
            }
        }
        
        if keyCombination.action == .release || keyCombination.action == .both {
            if let releasedEvent = Self.toReleasedCGEvent(from: keyCombination) {
                events.append(releasedEvent)
            }
        }
        
        return events
    }
    
    private static func toPressedCGEvent(from keyCombination: KeyCombination) -> CGEvent? {
        return Self.toCGEvent(from: keyCombination, pressed: true)
    }
    
    private static func toReleasedCGEvent(from keyCombination: KeyCombination) -> CGEvent? {
        return Self.toCGEvent(from: keyCombination, pressed: false)
    }
    
    private static func toCGEvent(from keyCombination: KeyCombination, pressed: Bool) -> CGEvent? {
        guard let cgEvent =  CGEvent(
                keyboardEventSource: nil,
                virtualKey: CGKeyCode(keyCombination.key.rawValue),
                keyDown: pressed
        ) else { return nil }
        
        cgEvent.flags = []

        if keyCombination.command == true {
            cgEvent.flags.insert(.maskCommand)
        }
        
        if keyCombination.option == true {
            cgEvent.flags.insert(.maskAlternate)
        }
        
        if keyCombination.control == true {
            cgEvent.flags.insert(.maskControl)
        }
        
        if keyCombination.fn == true {
            cgEvent.flags.insert(.maskSecondaryFn)
        }
        
        if keyCombination.shift == true {
            cgEvent.flags.insert(.maskShift)
        }

        return cgEvent
    }
    
    static func toKeyCombination(from cgEvent: CGEvent) -> KeyCombination? {
        guard let keyCode = KeyCode(rawValue: cgEvent.getIntegerValueField(.keyboardEventKeycode)) else { return nil }
        
        let keyCombination = KeyCombination(
            key: keyCode,
            command: cgEvent.flags.contains(.maskCommand),
            option: cgEvent.flags.contains(.maskAlternate),
            control: cgEvent.flags.contains(.maskControl),
            fn: cgEvent.flags.contains(.maskSecondaryFn),
            shift: cgEvent.flags.contains(.maskShift),
            action: cgEvent.type == CGEventType.keyDown ? .press : .release
        )
        
        return keyCombination
    }

}
