extension AccessibilityStrategyNormalMode {
    
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let lineStart = element.currentLine.start    
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findPrevious(character, before: lineCaretLocation, in: lineText) {
            newElement.caretLocation = lineStart + characterFoundLocation + 1
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
