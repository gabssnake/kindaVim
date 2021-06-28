import Foundation


enum VimEngineMode {
    
    case normal
    case insert
    case operatorPending
    case visual
    
}


enum VimEngineMoveStyle {
    
    case characterwise
    case linewise
    
}


class VimEngine {
    
    static var shared = VimEngine()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()
    
    var lastYankStyle: VimEngineMoveStyle = .characterwise
    var visualStyle: VimEngineMoveStyle = .characterwise
    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var asNormalMode: AccessibilityStrategyNormalModeProtocol = AccessibilityStrategyNormalMode()
    var asVisualMode: AccessibilityStrategyVisualModeProtocol = AccessibilityStrategyVisualMode()

    
    private init() {
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        switch currentMode {
        case .normal:
            handleNormalMode(with: keyCombination)
        case .operatorPending:
            handleOperatorPendingMode(with: keyCombination)
        case .visual:
            handleVisualMode(with: keyCombination)
        default:
            ()
        }
    }
    
    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()
        
        Display.reset()
    }
    
    func enterNormalMode() {
        if currentMode == .insert, var element = asNormalMode.h(on: focusedElement()) {
            element.selectedLength = 1
            _ = push(element: element)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()
        resetVisualMode()

        Display.tint()
    }
    
    private func enterOperatorPendingMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(keyCombination)
    }
    
    func enterVisualMode() {
        currentMode = .visual
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }
    
    private func resetVisualMode() {
        AccessibilityStrategyVisualMode.reset()
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityStrategy.focusedElement()
    }

    @discardableResult
    private func push(element: AccessibilityTextElement) -> Bool {
        return AccessibilityStrategy.push(element: element)
    }
    
}


// normal mode
extension VimEngine {
 
    func handleNormalMode(with keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        // to test (can dump info to console, send stuff to AX etc.)
        case .commandD:
            if let element = AccessibilityStrategyNormalMode.test(element: focusedElement()) {
                _ = push(element: element)
            }
        // temporary for escape to enter Command Mode
        // and escape again to send escape key to macOS
        case .escape:
            enterInsertMode()            
            post(keyboardStrategy.escape())
            
            if var element = focusedElement() {
                element.selectedLength = 0
                _ = push(element: element)
            }
        // temporary for pressing enter in Command Mode
        // to act like an enter in Insert Mode
        // checking if it feels better (like in Alfred)
        case .enter:
            enterInsertMode()
            
            post(keyboardStrategy.enter())
        case .caret:
            if var element = asNormalMode.caret(on: focusedElement()) {
                element.selectedLength = 1                    
                _ = push(element: element)
            } else {
                post(keyboardStrategy.caret())
            }
        case .dollarSign:
            if var element = asNormalMode.dollarSign(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.dollarSign())
            }
        case .leftBrace:
            if var element = asNormalMode.leftBrace(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            }
        case .leftBracket:
            enterOperatorPendingMode(with: KeyCombination(key: .leftBracket))
        case .percent:
            if var element = asNormalMode.percent(on: focusedElement()) {
                element.selectedLength = 1                  
                push(element: element)
            }
        case .rightBrace:
            if var element = asNormalMode.rightBrace(on: focusedElement()) {
                // move can go to the last empty line, but in that case we can't select the character as there is none
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1                  
                push(element: element)
            }
        case .rightBracket:
            enterOperatorPendingMode(with: KeyCombination(key: .rightBracket))
        case .underscore:
            if var element = asNormalMode.underscore(on: focusedElement()) {
                element.selectedLength = 1                    
                _ = push(element: element)
            } else {
                post(keyboardStrategy.underscore())
            }
        case .zero:
            if var element = asNormalMode.zero(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.zero())
            }
        case .a:
            enterInsertMode()
            
            if var element = asNormalMode.a(on: focusedElement()) {
                element.selectedLength = 0
                push(element: element)
            } else {
                post(keyboardStrategy.a())
            }
        case .A:
            enterInsertMode()
            
            if var element = asNormalMode.A(on: focusedElement()) {
                element.selectedLength = 0
                push(element: element)
            } else {
                post(keyboardStrategy.A())
            }
        case .b:
            if var element = asNormalMode.b(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.b())
            }
        case .B:
            if var element = asNormalMode.B(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.b())
            }
        case .c:
            enterOperatorPendingMode(with: keyCombination)
        case .C:
            enterInsertMode()
            
            if let element = asNormalMode.C(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.C())
            }
        case .d:
            enterOperatorPendingMode(with: keyCombination)
        case .controlD:
            post(keyboardStrategy.controlD())
        case .e:
            if var element = asNormalMode.e(on: focusedElement()) {
                // move can go to the last empty line, but in that case we can't select the character as there is none
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1                    
                push(element: element)
            }
        case .E:
            if var element = asNormalMode.E(on: focusedElement()) {
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1                   
                push(element: element)
            }
        case .f:
            enterOperatorPendingMode(with: keyCombination)
        case .F:
            enterOperatorPendingMode(with: keyCombination)
        case .g:
            enterOperatorPendingMode(with: keyCombination)
        case .G:
            if var element = asNormalMode.G(on: focusedElement()) {
                // move can go to the last empty line, but in that case we can't select the character as there is none
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                push(element: element)
            } else {
                post(keyboardStrategy.G())
            }
        case .h:
            if var element = asNormalMode.h(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            } else {
                post(keyboardStrategy.h())
            }
        case .i:
            if var element = asNormalMode.i(on: focusedElement()) {
                element.selectedLength = 0
                push(element: element)
            }
            
            enterInsertMode()
        case .I:
            enterInsertMode()
            
            if var element = asNormalMode.I(on: focusedElement()) {
                element.selectedLength = 0
                push(element: element)
            } else {
                post(keyboardStrategy.I())
            }
        case .j:
            if var element = asNormalMode.j(on: focusedElement()) {
                // move can go to the last empty line, but in that case we can't select the character as there is none
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                push(element: element)
            } else {
                post(keyboardStrategy.j())
            }
        case .k:
            if var element = asNormalMode.k(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            } else {
                post(keyboardStrategy.k())
            }
        case .l:
            if var element = asNormalMode.l(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            } else {
                post(keyboardStrategy.l())
            }
        case .o:
            enterInsertMode()
            
            if let element = asNormalMode.o(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.o())
            }
        case .O:
            enterInsertMode()
            
            if let element = asNormalMode.O(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.O())
            }
        case .p:
            if let element = asNormalMode.p(on: focusedElement()) {
                push(element: element)
                
                if var element = asNormalMode.h(on: focusedElement()) {                        
                    element.selectedLength = 1
                    _ = push(element: element)
                }   
            } else {
//                post(keyboardStrategy.p())
            }
        case .P:
            if let element = asNormalMode.P(on: focusedElement()) {
                push(element: element)
                
                if var element = asNormalMode.h(on: focusedElement()) {                        
                    element.selectedLength = 1
                    _ = push(element: element)
                }   
            } else {
                //                post(keyboardStrategy.P())
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
        case .v:
            enterVisualMode()
            visualStyle = .characterwise
            
            if var element = asVisualMode.v(on: focusedElement()) {
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                push(element: element)
            }
        case .V:
            enterVisualMode()
            visualStyle = .linewise
            
            if let element = asVisualMode.V(on: focusedElement()) {
                push(element: element)
            }
        case .w:
            if var element = asNormalMode.w(on: focusedElement()) {
                // move can go to the last empty line, but in that case we can't select the character as there is none
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                push(element: element)
            } else {
                post(keyboardStrategy.w())
            }
        case .W:
            if var element = asNormalMode.W(on: focusedElement()) {
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                push(element: element)
            } else {
                post(keyboardStrategy.w())
            }            
        case .x:
            if let element = asNormalMode.x(on: focusedElement()) {
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
        case .Y:
            if var element = asNormalMode.yy(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.yy())
            }                
        default:
            ()
        }
    }
        
}


// operator pending mode
extension VimEngine {
    
    func handleOperatorPendingMode(with keyCombination: KeyCombination) {
        operatorPendingBuffer.append(keyCombination)
        
        parseOperatorCommand()
        
        if currentMode != .operatorPending {
            resetOperatorPendingBuffer()
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
            
            if let element = asNormalMode.cc(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.cc())
            }
        case [.c, .f]:
            ()
        case [.c, .F]:
            ()
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
            
            let axFocusedElement = focusedElement()
            
            if let element = asNormalMode.ciDoubleQuote(on: axFocusedElement), element != axFocusedElement {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .singleQuote]:
            enterNormalMode()
            
            let axFocusedElement = focusedElement()
            
            if let element = asNormalMode.ciSingleQuote(on: axFocusedElement), element != axFocusedElement {
                push(element: element)
                enterInsertMode()
            }            
        case [.c, .i, .backtick]:
            enterNormalMode()
            
            let axFocusedElement = focusedElement()
            
            if let element = asNormalMode.ciBacktick(on: axFocusedElement), element != axFocusedElement {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .w]:
            enterInsertMode()
            
            if let element = asNormalMode.ciw(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.ciw())
            }           
        case [.c, .t]:
            ()
        case [.c, .T]:
            ()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            ()
        case [.d, .b]:
            enterNormalMode()
            
            post(keyboardStrategy.db())
        case [.d, .d]:
            enterNormalMode()
            
            if let element = asNormalMode.dd(on: focusedElement()) {
                push(element: element)
                
                if var element = focusedElement() {
                    element.selectedLength = 1
                    push(element: element)
                }
            } else {
                post(keyboardStrategy.dd())
            }
        case [.d, .f]:
            ()
        case [.d, .F]:
            ()
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
        case [.d, .t]:
            ()
        case [.d, .T]:
            ()
        case [.g, .e]:
            enterNormalMode()
            
            if var element = asNormalMode.ge(on: focusedElement()) {
                element.selectedLength = 1                
                push(element: element)
            }     
        case [.g, .g]:
            enterNormalMode()
            
            if var element = asNormalMode.gg(on: focusedElement()) {
                element.selectedLength = 1                
                push(element: element)
            } else {
                post(keyboardStrategy.gg())
            }
        case [.g, .E]:
            enterNormalMode()
            
            if var element = asNormalMode.gE(on: focusedElement()) {
                element.selectedLength = 1                
                push(element: element)
            }
        case [.leftBracket, .leftBrace]:
            enterNormalMode()
            
            if var element = asNormalMode.leftBracketLeftBrace(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            }
        case [.leftBracket, .leftParenthesis]:
            enterNormalMode()
            
            if var element = asNormalMode.leftBracketLeftParenthesis(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            }
        case [.rightBracket, .rightBrace]:
            enterNormalMode()
            
            if var element = asNormalMode.rightBracketRightBrace(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            }
        case [.rightBracket, .rightParenthesis]:
            enterNormalMode()
            
            if var element = asNormalMode.rightBracketRightParenthesis(on: focusedElement()) {
                element.selectedLength = 1
                push(element: element)
            }
        case [.y, .f]:
            ()
        case [.y, .F]:
            ()
        case [.y, .i]:
            ()
        case [.y, .i, .doubleQuote]:
            enterNormalMode()
            
            if var element = asNormalMode.yiDoubleQuote(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            }
        case [.y, .i, .w]:
            enterNormalMode()
            
            post(keyboardStrategy.yiw())
        case [.y, .t]:
            ()
        case [.y, .T]:
            ()        
        case [.y, .y]:
            enterNormalMode()
            lastYankStyle = .linewise
            
            if var element = asNormalMode.yy(on: focusedElement()) {
                element.selectedLength = 1
                _ = push(element: element)
            } else {
                post(keyboardStrategy.yy())
            }
        default:
            // cf, cF, ct, cT
            if operatorPendingBuffer.first?.vimKey == .c {
                let axFocusedElement = focusedElement()
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cf(to: character.character, on: axFocusedElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cF(to: character.character, on: axFocusedElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.ct(to: character.character, on: axFocusedElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cT(to: character.character, on: axFocusedElement)
                }
                
                if let element = element, element != axFocusedElement {
                    push(element: element)
                    enterInsertMode()
                    
                    return
                }
            }
            
            // df, dF, dt, dT
            if operatorPendingBuffer.first?.vimKey == .d {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.df(to: character.character, on: focusedElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dF(to: character.character, on: focusedElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dt(to: character.character, on: focusedElement())                                           
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dT(to: character.character, on: focusedElement())               
                }
                
                if let element = element {
                    push(element: element)
                    
                    if var element = focusedElement() {
                        element.selectedLength = 1
                        _ = push(element: element)
                    }
                }
            }
                            
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if var element = asNormalMode.f(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if var element = asNormalMode.F(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {
                let axFocusedElement = focusedElement()
                
                if let element = asNormalMode.r(with: replacement.character, on: axFocusedElement) {
                    if element != axFocusedElement {
                        _ = push(element: element)
                        
                        if var element = asNormalMode.h(on: focusedElement()) {                        
                            element.selectedLength = 1
                            _ = push(element: element)
                        }                        
                    }
                } else {
                    post(keyboardStrategy.r(with: replacement))
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if var element = asNormalMode.t(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                if var element = asNormalMode.T(to: character.character, on: focusedElement()) {
                    element.selectedLength = 1
                    _ = push(element: element)
                }
            }
            
            // yf, yF, yt, yT
            if operatorPendingBuffer.first?.vimKey == .y {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yf(to: character.character, on: focusedElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yF(to: character.character, on: focusedElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yt(to: character.character, on: focusedElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yT(to: character.character, on: focusedElement())                    
                }
                
                if var element = element {
                    element.selectedLength = 1
                    push(element: element)
                }
            }
                        
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
}


// visual mode
extension VimEngine {
    
    func handleVisualMode(with keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .c:
            enterInsertMode()
            
            if let element = asVisualMode.c(on: focusedElement()) {                
                push(element: element)
            }
        case .d:
            enterNormalMode()
            
            if let element = asVisualMode.d(on: focusedElement()) {                
                push(element: element)
                
                if var element = focusedElement() {
                    element.selectedLength = 1
                    push(element: element)
                }
            }
        case .h:
            if let element = asVisualMode.h(on: focusedElement()) {
                push(element: element)
            }
        case .l:
            if let element = asVisualMode.l(on: focusedElement()) {
                push(element: element)
            }
        case .o:
            if let element = asVisualMode.o(on: focusedElement()) {
                push(element: element)
            }
        case .v:
            if var element = asVisualMode.v(on: focusedElement()) {
                element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                push(element: element)
            }
            
            if visualStyle == .characterwise {
                enterNormalMode()
            } else {
                visualStyle = .characterwise
            }
        case .V:
            if var element = asVisualMode.V(on: focusedElement()) {
                if visualStyle == .linewise {
                    element.selectedLength = (element.caretLocation == element.value.count) ? 0 : 1
                }
                
                push(element: element)
            }
            
            if visualStyle == .linewise {
                enterNormalMode()
            } else {
                visualStyle = .linewise
            }
        case .dollarSign:
            if let element = asVisualMode.dollarSign(on: focusedElement()) {
                push(element: element)
            }            
        default:
            ()
        }
    }
    
}
