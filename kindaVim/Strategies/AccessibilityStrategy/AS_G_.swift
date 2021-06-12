extension AccessibilityStrategy {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        let lastLine = textEngine.lastLine(in: element.value)
        let characterFoundLocation = textEngine.firstNonBlank(in: lastLine.value)        
        
        if characterFoundLocation >= lastLine.value.endLimit { 
            element.caretLocation = lastLine.start + lastLine.value.endLimit
        } else {
            element.caretLocation = lastLine.start + characterFoundLocation
        }            
        
        return element
    }
    
}
