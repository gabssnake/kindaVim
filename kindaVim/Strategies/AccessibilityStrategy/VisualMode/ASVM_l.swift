extension AccessibilityStrategyVisualMode {
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if VimEngine.shared.visualStyle == .characterwise {
            if element.caretLocation < Self.anchor {
                element.caretLocation += 1
                element.selectedLength -= 1
            } else if element.caretLocation + element.selectedLength < element.currentLine.end! {
                element.selectedLength += 1            
            }            
        }        
        
        return element
    }
    
}
