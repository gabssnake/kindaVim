extension AccessibilityStrategy {
    
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        let characterUndeCaretIndex = element.value.index(element.value.startIndex, offsetBy: element.caretLocation)
        let characterUnderCaretText = element.value[characterUndeCaretIndex]
        guard characterUnderCaretText != "\n" else { return element }
        
        if replacement == "\u{1b}" {
            element.selectedLength = 1
            element.selectedText = String(characterUnderCaretText)
            
            return element
        }
        
        element.selectedLength = 1
        element.selectedText = replacement.isNewline ? "\n" : String(replacement)

        return element
    }
    
}
