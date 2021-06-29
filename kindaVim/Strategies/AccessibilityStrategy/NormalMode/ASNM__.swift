extension AccessibilityStrategyNormalMode {
    
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {}
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        let lineText = element.currentLine.value                
        element.caretLocation = element.currentLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineText))
        
        return element
    }
    
}
