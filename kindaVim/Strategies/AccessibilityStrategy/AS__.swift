extension AccessibilityStrategy {
    
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        let lineText = element.currentLine.value        
        let characterFoundLocation = textEngine.firstNonBlank(in: lineText)
        let newCaretLocation = element.currentLine.start! + characterFoundLocation
        
        if newCaretLocation >= element.currentLine.endLimit! { 
            element.caretLocation = element.currentLine.endLimit!
        } else {
            element.caretLocation = newCaretLocation
        }         
        
        return element
    }
    
}
