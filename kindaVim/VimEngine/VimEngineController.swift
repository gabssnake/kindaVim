//
//  VimEngineController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

enum VimEngineMode {
    case command
    case insert
    case operatorPending
}

class VimEngineController {
    
    static var shared = VimEngineController()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = ""

    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()

    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        if currentMode != .operatorPending {
            switch keyCombination.vimKey {
            case .dollarSign:
                post(keyboardStrategy.dollarSign())
            case .underscore:
                post(keyboardStrategy.underscore())
            case .zero:
                post(keyboardStrategy.zero())
            case .a:
                enterInsertMode()

                post(keyboardStrategy.a())
            case .A:
                enterInsertMode()

                post(keyboardStrategy.A())
            case .b:
                post(keyboardStrategy.b())
            case .c:
                enterOperatorPendingMode(with: "c")
            case .C:
                enterInsertMode()

                post(keyboardStrategy.C())
            case .d:
                enterOperatorPendingMode(with: "d")
            case .g:
                enterOperatorPendingMode(with: "g")
            case .G:
                post(keyboardStrategy.G())
            case .h:
                if let element = AccessibilityStrategy.h(on: focusedElement()) {
                    // ugly, need to refactor
                    if write(element: element) == false {
                        post(keyboardStrategy.h())
                    }
                }

                post(keyboardStrategy.h())
            case .i:
                enterInsertMode()
            case .I:
                enterInsertMode()

                post(keyboardStrategy.I())
            case .j:
                post(keyboardStrategy.j())
            case .k:
                post(keyboardStrategy.k())
            case .l:
                if let element = AccessibilityStrategy.l(on: focusedElement()) {
                    if write(element: element) == false {
                        post(keyboardStrategy.l())
                    }
                }

                post(keyboardStrategy.l())
            case .o:
                enterInsertMode()

                post(keyboardStrategy.o())
            case .O:
                enterInsertMode()

                post(keyboardStrategy.O())
            case .controlR:
                post(keyboardStrategy.controlR())
            case .u:
                post(keyboardStrategy.u())
            case .w:
                post(keyboardStrategy.w())
            case .x:
                post(keyboardStrategy.x())
            case .X:
                post(keyboardStrategy.X())
            default:
                ()
            }
        } else {
            switch keyCombination.key {
            case .c:
                operatorPendingBuffer.append("c")
            case .g:
                operatorPendingBuffer.append("g")
            case .d:
                operatorPendingBuffer.append("d")
            case .i:
                operatorPendingBuffer.append("i")
            case .w:
                operatorPendingBuffer.append("w")
            default:
                // TODO: handle this better
                // this is to avoid repeating the
                // resetOperatorPendingBuffer() and enterCommandMode()
                // of the default case of operatorCommand
                operatorPendingBuffer.append("69 LOL")
            }

            if let operatorCommand = operatorCommand() {
                post(operatorCommand)
            }
        }
    }
    
    private func operatorCommand() -> [KeyCombination]? {
        print(operatorPendingBuffer)
        
        switch operatorPendingBuffer {
        case "cc":
            enterInsertMode()
            
            return keyboardStrategy.cc()
        case "gg":
            enterCommandMode()
            
            return keyboardStrategy.gg()
        case "dd":
            enterCommandMode()
            
            return keyboardStrategy.dd()
        case "ci":
            return []
        case "ciw":
            enterInsertMode()
            
            return keyboardStrategy.ciw()
        default:
            resetOperatorPendingBuffer()
            enterCommandMode()
            
            return nil
        }        
    }
    
    func enterCommandMode() {
        currentMode = .command
        resetOperatorPendingBuffer()

        Display.tint()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        Display.reset()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = ""
    }
    
    private func enterOperatorPendingMode(with operator: String) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(`operator`)
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityElement? {
        return AccessibilityStrategy.focusedElement()
    }

    private func write(element: AccessibilityElement) -> Bool {
        return AccessibilityStrategy.write(element: element)
    }
    
}
