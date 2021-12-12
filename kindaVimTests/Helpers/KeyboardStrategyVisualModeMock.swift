@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var functionCalled = ""
    
    func bForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caretForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSignForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func eForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gCaretForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSignForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func geForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gIForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gjForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gjForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gkForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gkForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZeroForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func GForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func GForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func GForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func hForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func jForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func jForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
      
    func kForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
       
    func kForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
       
    func lForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscoreForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func VForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForTextElementWhenEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func VForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForTextElementWhenEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForTextElementWhenInVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForTextElementWhenInVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func wForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
   
    func y() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func zeroForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
}
