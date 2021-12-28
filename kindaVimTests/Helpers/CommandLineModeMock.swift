@testable import kindaVim
import KeyCombination


class CommandLineModeMock: CommandLineModeProtocol {
    
    var functionCalled = ""
        
    
    func q() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func w() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func wq() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
} 
