import Foundation

enum VimEngineMode {
    case normal
    case insert
    case operatorPending
}

class VimEngine {
    
    static var shared = VimEngine()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()

    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()

    private init() {
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        if currentMode != .operatorPending {
            switch keyCombination.vimKey {
            // to test (can dump info to console, send stuff to AX etc.)
            case .commandD:
                if let element = AccessibilityStrategy.test(element: focusedElement()) {
                    _ = push(element: element)
                }
            // temporary for escape to enter Command Mode
            // and escape again to send escape key to macOS
            case .escape:
                enterInsertMode()

                post(keyboardStrategy.escape())
            // temporary for pressing enter in Command Mode
            // to act like an enter in Insert Mode
            // checking if it feels better (like in Alfred)
            case .enter:
                enterInsertMode()

                post(keyboardStrategy.enter())
            case .caret:
                if var element = accessibilityStrategy.caret(on: focusedElement()) {
                    element.selectedLength = 1                    
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.caret())
                }
            case .dollarSign:
                if var element = accessibilityStrategy.dollarSign(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.dollarSign())
                }
            case .underscore:
                if var element = accessibilityStrategy.underscore(on: focusedElement()) {
                    element.selectedLength = 1                    
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.underscore())
                }
            case .zero:
                if var element = accessibilityStrategy.zero(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.zero())
                }
            case .a:
                enterInsertMode()

                if let element = accessibilityStrategy.a(on: focusedElement()) {
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.a())
                }
            case .A:
                enterInsertMode()

                if let element = accessibilityStrategy.A(on: focusedElement()) {
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.A())
                }
            case .b:
                if var element = accessibilityStrategy.b(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.b())
                }  
            case .c:
                enterOperatorPendingMode(with: keyCombination)
            case .C:
                enterInsertMode()

                post(keyboardStrategy.C())
            case .d:
                enterOperatorPendingMode(with: keyCombination)
            case .controlD:
                post(keyboardStrategy.controlD())
            case .e:
                if var element = accessibilityStrategy.e(on: focusedElement()) {
                    element.selectedLength = 1                    
                    _ = push(element: element)
                }
            case .f:
                enterOperatorPendingMode(with: keyCombination)
            case .F:
                enterOperatorPendingMode(with: keyCombination)
            case .g:
                enterOperatorPendingMode(with: keyCombination)
            case .G:
                if var element = accessibilityStrategy.G(on: focusedElement()) {
                    // G can go to the last empty line, but in that case we can't select the character as there is none
                    element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.G())
                }
            case .h:
                if var element = accessibilityStrategy.h(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.h())
                }
            case .i:
                if let element = accessibilityStrategy.i(on: focusedElement()) {
                    _ = push(element: element)
                }
                
                enterInsertMode()
            case .I:
                enterInsertMode()
                
                if let element = accessibilityStrategy.I(on: focusedElement()) {
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.I())
                }
            case .j:
                if var element = accessibilityStrategy.j(on: focusedElement()) {
                    element.selectedLength = 1                    
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.j())
                }
            case .k:
                if var element = accessibilityStrategy.k(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.k())
                }
            case .l:
                if var element = accessibilityStrategy.l(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.l())
                }
            case .o:
                enterInsertMode()

                if let element = accessibilityStrategy.o(on: focusedElement()) {
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.o())
                }
            case .O:
                enterInsertMode()
                
                if let element = accessibilityStrategy.O(on: focusedElement()) {
                    _ = push(element: element)
                } else {
                   post(keyboardStrategy.O())
                }
            case .r:
                enterOperatorPendingMode(with: keyCombination)
            case .controlR:
                post(keyboardStrategy.controlR())
            case .s:
                enterInsertMode()
                
                post(keyboardStrategy.s())
            case .t:
                enterOperatorPendingMode(with: keyCombination)
            case .T:
                enterOperatorPendingMode(with: keyCombination)
            case .u:
                post(keyboardStrategy.u())
            case .controlU:
                post(keyboardStrategy.controlU())
            case .w:
                if var element = accessibilityStrategy.w(on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                } else {
                    post(keyboardStrategy.w())
                }
            case .x:
                if let element = accessibilityStrategy.x(on: focusedElement()) {
                    _ = push(element: element)
                    
                    if var element = focusedElement() {
                        element.selectedLength = 1
                        _ = push(element: element)
                    }
                } else {
                    post(keyboardStrategy.x())
                }                
            case .X:
                post(keyboardStrategy.X())
            case .y:
                enterOperatorPendingMode(with: keyCombination)
            default:
                ()
            }
        } else {
            operatorPendingBuffer.append(keyCombination)
            
            parseOperatorCommand()

            if currentMode != .operatorPending {
                resetOperatorPendingBuffer()
            }
        }
    }
    
    private func parseOperatorCommand() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            ()
        case [.c, .b]:
            enterInsertMode()
            
            post(keyboardStrategy.cb())
        case [.c, .c]:
            enterInsertMode()
            
            if let element = accessibilityStrategy.cc(on: focusedElement()) {
                _ = push(element: element)
            } else {
                post(keyboardStrategy.cc())
            }
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            enterInsertMode()
            
            post(keyboardStrategy.cgg())
        case [.c, .G]:
            enterInsertMode()
            
            post(keyboardStrategy.cG())
        case [.c, .i]:
            ()
        case [.c, .i, .doubleQuote]:
            enterNormalMode()
            
            if let element = accessibilityStrategy.ciDoubleQuote(on: focusedElement()) {
                if push(element: element) == true {
                    enterInsertMode()
                }
            }
        case [.c, .i, .w]:
            enterInsertMode()
            
            if let element = accessibilityStrategy.ciw(on: focusedElement()) {
                _ = push(element: element)
            } else {
                post(keyboardStrategy.ciw())
            }            
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            ()
        case [.d, .b]:
            enterNormalMode()
            
            post(keyboardStrategy.db())
        case [.d, .d]:
            enterNormalMode()
            
            if let element = accessibilityStrategy.dd(on: focusedElement()) {
                _ = push(element: element)
                
                if var element = focusedElement() {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            } else {
                post(keyboardStrategy.dd())
            }
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            enterNormalMode()
            
            post(keyboardStrategy.dgg())
        case [.d, .i]:
            ()
        case [.d, .i, .w]:
            ()
        case [.d, .j]:
            enterNormalMode()
            
            post(keyboardStrategy.dj())
        case [.d, .G]:
            enterNormalMode()
            
            post(keyboardStrategy.dG())
        case [.g, .g]:
            enterNormalMode()
            
            if var element = accessibilityStrategy.gg(on: focusedElement()) {
                element.selectedLength = 1                
                _ = push(element: element)
            } else {
                post(keyboardStrategy.gg())
            }
        case [.y, .i]:
            ()
        case [.y, .i, .w]:
            enterNormalMode()
            
            post(keyboardStrategy.yiw())
        case [.y, .y]:
            enterNormalMode()
            
            if var element = accessibilityStrategy.yy(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.yy())
            }
        default:
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if var element = accessibilityStrategy.f(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if var element = accessibilityStrategy.F(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    let result = push(element: element)
                    print(result)
                }
            }

            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {
                post(keyboardStrategy.r(with: replacement))
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if var element = accessibilityStrategy.t(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                if var element = accessibilityStrategy.T(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }

            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
    func enterNormalMode() {
        if currentMode == .insert, var element = accessibilityStrategy.h(on: focusedElement()) {
            element.selectedLength = 1
            _ = push(element: element)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()

        Display.tint()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        Display.reset()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }
    
    private func enterOperatorPendingMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(keyCombination)
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityStrategy.focusedElement()
    }

    private func push(element: AccessibilityTextElement) -> Bool {
        return AccessibilityStrategy.push(element: element)
    }
    
}
