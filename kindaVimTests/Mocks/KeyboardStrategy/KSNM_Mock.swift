@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation
import AXEngine
import Common


class KeyboardStrategyNormalModeMock: KeyboardStrategyNormalModeProtocol {
    
    var axEngine: AXEngineProtocol = AXEngine()
    
    var functionCalled = ""
    var relevantParameter = ""
    var lastSearchCommandParameter: LastSearchCommand?
    
        
    func A(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func a(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func b(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caret(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cb(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cc(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cDollarSign(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ce(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cG(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cgg(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ch(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ciw(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cl(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlB() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlD() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlF() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlR() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlRForAXElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func controlU() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cw(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func db(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dDollarSign(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dd(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func de(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dG(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dgg(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dh(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dj(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dk(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dl(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSign(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dw(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func e(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func escape() -> [KeyCombination] {
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
    
    func gUnderscore(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZero(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ge(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gI(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gj(times count: Int?) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gk(times count: Int?) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func G(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gg(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func h(times count: Int?) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func I(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func i() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func interrogationMark(to searchString: String) -> [KeyCombination] {
        functionCalled = #function
        lastSearchCommandParameter = LastSearchCommand(motion: .interrogationMark, searchString: searchString)
        
        return []
    }
    
    func J(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func j(times count: Int?) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func k(times count: Int?) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func l(times count: Int?) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func N(times count: Int?, lastSearchCommand: LastSearchCommand) -> [KeyCombination] {
        functionCalled = #function
        lastSearchCommandParameter = lastSearchCommand
        
        return []
    }
    
    func n(times count: Int?, lastSearchCommand: LastSearchCommand) -> [KeyCombination] {
        functionCalled = #function
        lastSearchCommandParameter = lastSearchCommand
        
        return []
    }
    
    func O(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func o(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func P(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func p(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func r(with replacement: KeyCombination, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        relevantParameter = String(replacement.character)
        
        return[]
    }
    
    func `return`(times count: Int?, _ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func slash(to searchString: String) -> [KeyCombination] {
        functionCalled = #function
        lastSearchCommandParameter = LastSearchCommand(motion: .slash, searchString: searchString)
        
        return []
    }
    
    func u() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func uForAXElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscore(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func w(times count: Int?, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yy(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yiw(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zero(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func post(_ keyCombinations: [KeyCombination]) {}
    
}
