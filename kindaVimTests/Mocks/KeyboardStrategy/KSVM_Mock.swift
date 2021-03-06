@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation
import AXEngine
import Common


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var axEngine: AXEngineProtocol = AXEngine()
    var functionCalled = ""
    
    
    func b(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func C(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func c(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caret(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func D(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func d(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSign(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func e(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func escape(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gCaret(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSign(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ge(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gg(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gI(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gj(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gk(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZero(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func G(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func h(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func j(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func k(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
       
    func iw(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func l(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func R(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func `return`(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func S(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscore(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func VFromNormalMode(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VFromVisualMode(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vFromNormalMode(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vFromVisualMode(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func w(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
   
    func Y(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func y(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zero(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
       
}
