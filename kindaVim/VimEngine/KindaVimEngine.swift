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


class KindaVimEngine {
    
    static var shared = KindaVimEngine()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()
    
    var lastYankStyle: VimEngineMoveStyle = .characterwise
    var visualStyle: VimEngineMoveStyle = .characterwise
    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()
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
        if currentMode == .insert, let element = asNormalMode.h(on: focusedElement()) {
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
        keyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityTextElement? {
        return accessibilityStrategy.focusedElement()
    }

    @discardableResult
    private func push(element: AccessibilityTextElement) -> Bool {
        return accessibilityStrategy.push(element: element)
    }
    
}


// normal mode
extension KindaVimEngine {
 
    func handleNormalMode(with keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .a:
            enterInsertMode()
            
            if let element = asNormalMode.a(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.a())
            }
        case .A:
            enterInsertMode()
            
            if let element = asNormalMode.A(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.A())
            }
        case .b:
            if let element = asNormalMode.b(on: focusedElement()) {
               push(element: element)
            } else {
                post(keyboardStrategy.b())
            }
        case .B:
            if let element = asNormalMode.B(on: focusedElement()) {
                push(element: element)
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
            if let element = asNormalMode.e(on: focusedElement()) {
                push(element: element)
            }
        case .E:
            if let element = asNormalMode.E(on: focusedElement()) {
                push(element: element)
            }
        case .f:
            enterOperatorPendingMode(with: keyCombination)
        case .F:
            enterOperatorPendingMode(with: keyCombination)
        case .g:
            enterOperatorPendingMode(with: keyCombination)
        case .G:
            if let element = asNormalMode.G(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.G())
            }
        case .h:
            if let element = asNormalMode.h(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.h())
            }
        case .i:
            if let element = asNormalMode.i(on: focusedElement()) {
                push(element: element)
            }
            
            enterInsertMode()
        case .I:
            enterInsertMode()
            
            if let element = asNormalMode.I(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.I())
            }
        case .j:
            if let element = asNormalMode.j(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.j())
            }
        case .k:
            if let element = asNormalMode.k(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.k())
            }
        case .l:
            if let element = asNormalMode.l(on: focusedElement()) {
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
                    element.selectedLength = element.characterLength
                    push(element: element)
                }   
            } else {
//                post(keyboardStrategy.p())
            }
        case .P:
            if let element = asNormalMode.P(on: focusedElement()) {
                push(element: element)
                
                if var element = asNormalMode.h(on: focusedElement()) {                        
                    element.selectedLength = element.characterLength
                    push(element: element)
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
            
            if let element = asVisualMode.v(on: focusedElement()) {
                push(element: element)
            }
        case .V:
            enterVisualMode()
            visualStyle = .linewise
            
            if let element = asVisualMode.V(on: focusedElement()) {
                push(element: element)
            }
        case .w:
            if let element = asNormalMode.w(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.w())
            }
        case .W:
            if let element = asNormalMode.W(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.w())
            }            
        case .x:
            if let element = asNormalMode.x(on: focusedElement()) {
                push(element: element)
                
                if var element = focusedElement() {
                    element.selectedLength = element.characterLength
                    element.selectedText = nil
                    push(element: element)
                }
            } else {
                post(keyboardStrategy.x())
            }                
        case .X:
            post(keyboardStrategy.X())
        case .y:
            enterOperatorPendingMode(with: keyCombination)
        case .Y:
            lastYankStyle = .linewise

            if let element = asNormalMode.yy(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.yy())
            }
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
                element.selectedText = nil
                push(element: element)
            }
        // temporary for pressing enter in Command Mode
        // to act like an enter in Insert Mode
        // checking if it feels better (like in Alfred)
        case .enter:
            enterInsertMode()
            
            post(keyboardStrategy.enter())
        case .caret:
            if let element = asNormalMode.caret(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.caret())
            }
        case .dollarSign:
            if let element = asNormalMode.dollarSign(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.dollarSign())
            }
        case .leftBrace:
            if let element = asNormalMode.leftBrace(on: focusedElement()) {
                push(element: element)
            }
        case .leftBracket:
            enterOperatorPendingMode(with: KeyCombination(key: .leftBracket))
        case .percent:
            if let element = asNormalMode.percent(on: focusedElement()) {
                push(element: element)
            }
        case .rightBrace:
            if let element = asNormalMode.rightBrace(on: focusedElement()) {
                push(element: element)
            }
        case .rightBracket:
            enterOperatorPendingMode(with: KeyCombination(key: .rightBracket))
        case .underscore:
            if let element = asNormalMode.underscore(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.underscore())
            }
        case .zero:
            if let element = asNormalMode.zero(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.zero())
            }
        default:
            ()
        }
    }
        
}


// operator pending mode
extension KindaVimEngine {
    
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
                        
            // if element.selectedText is nil that means that ci" didn't find a pair of " to empty
            if let element = asNormalMode.ciDoubleQuote(on: focusedElement()), element.selectedText != nil {
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            }
        case [.c, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.ciSingleQuote(on: focusedElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }            
        case [.c, .i, .backtick]:
            enterNormalMode()
            
            if let element = asNormalMode.ciBacktick(on: focusedElement()), element.selectedText != nil {
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
                    element.selectedLength = element.characterLength
                    element.selectedText = nil
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
            
            if let element = asNormalMode.dj(on: focusedElement()) {
                push(element: element)
                
                if var element = focusedElement() {
                    element.selectedText = nil
                    push(element: element)
                }
            } else {
                post(keyboardStrategy.dj())
            }
        case [.d, .G]:
            enterNormalMode()
            
            post(keyboardStrategy.dG())
        case [.d, .t]:
            ()
        case [.d, .T]:
            ()
        case [.g, .e]:
            enterNormalMode()
            
            if let element = asNormalMode.ge(on: focusedElement()) {                
                push(element: element)
            }     
        case [.g, .g]:
            enterNormalMode()
            
            if let element = asNormalMode.gg(on: focusedElement()) {                
                push(element: element)
            } else {
                post(keyboardStrategy.gg())
            }
        case [.g, .E]:
            enterNormalMode()
            
            if let element = asNormalMode.gE(on: focusedElement()) {                
                push(element: element)
            }
        case [.leftBracket, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftBrace(on: focusedElement()) {
                push(element: element)
            }
        case [.leftBracket, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftParenthesis(on: focusedElement()) {
                push(element: element)
            }
        case [.rightBracket, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightBrace(on: focusedElement()) {
                push(element: element)
            }
        case [.rightBracket, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightParenthesis(on: focusedElement()) {
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
            
            if let element = asNormalMode.yiDoubleQuote(on: focusedElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .w]:
            enterNormalMode()
            lastYankStyle = .characterwise
            
            if let element = asNormalMode.yiw(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.yiw())
            }
        case [.y, .t]:
            ()
        case [.y, .T]:
            ()        
        case [.y, .y]:
            enterNormalMode()
            lastYankStyle = .linewise
            
            if let element = asNormalMode.yy(on: focusedElement()) {
                push(element: element)
            } else {
                post(keyboardStrategy.yy())
            }
        default:
            // cf, cF, ct, cT
            if operatorPendingBuffer.first?.vimKey == .c {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cf(to: character.character, on: focusedElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cF(to: character.character, on: focusedElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.ct(to: character.character, on: focusedElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cT(to: character.character, on: focusedElement())
                }
                
                if let element = element, element.selectedText != nil {
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
                        element.selectedLength = element.characterLength
                        element.selectedText = nil
                        push(element: element)
                    }
                }
            }
                            
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.f(to: character.character, on: focusedElement()) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.F(to: character.character, on: focusedElement()) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                if let element = asNormalMode.r(with: replacement.character, on: focusedElement()) {
                    if element.selectedText != nil {
                        push(element: element)
                        
                        if var element = asNormalMode.h(on: focusedElement()) {                        
                            element.selectedLength = element.characterLength
                            push(element: element)
                        }                        
                    }
                } else {
                    post(keyboardStrategy.r(with: replacement))
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.t(to: character.character, on: focusedElement()) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.T(to: character.character, on: focusedElement()) {
                    push(element: element)
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
                
                if let element = element {
                    push(element: element)
                    lastYankStyle = .characterwise                    
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
extension KindaVimEngine {
    
    func handleVisualMode(with keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .b:
            if let element = asVisualMode.b(on: focusedElement()) {
                push(element: element)
            }
        case .c:
            enterInsertMode()
            
            if let element = asVisualMode.c(on: focusedElement()) {                
                push(element: element)
            }
        case .d:
            if let element = asVisualMode.d(on: focusedElement()) {                
                push(element: element)
                
                if var element = focusedElement() {
                    element.selectedLength = 1
                    element.selectedText = nil
                    push(element: element)
                }
            }
            
            enterNormalMode()
        case .e:
            if let element = asVisualMode.e(on: focusedElement()) {
                push(element: element)
            }
        case .h:
            if let element = asVisualMode.h(on: focusedElement()) {
                push(element: element)
            }
        case .j:
            if let element = asVisualMode.j(on: focusedElement()) {
                push(element: element)
            }
        case .k:
            if let element = asVisualMode.k(on: focusedElement()) {
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
                element.selectedLength = element.characterLength
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
                    element.selectedLength = element.characterLength
                }
                
                push(element: element)
            }
            
            if visualStyle == .linewise {
                enterNormalMode()
            } else {
                visualStyle = .linewise
            }
        case .y:
            if let element = asVisualMode.y(on: focusedElement()) {
                push(element: element)
            }
            
            enterNormalMode()
        case .dollarSign:
            if let element = asVisualMode.dollarSign(on: focusedElement()) {
                push(element: element)
            }            
        case .escape:
            if let element = asVisualMode.escape(on: focusedElement()) {
                push(element: element)
            }      
            
            enterNormalMode()
        case .zero:
            if let element = asVisualMode.zero(on: focusedElement()) {
                push(element: element)
            }  
        default:
            ()
        }
    }
    
}
