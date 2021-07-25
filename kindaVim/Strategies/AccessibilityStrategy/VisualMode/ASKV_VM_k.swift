extension AccessibilityStrategyVisualMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            return kForVisualModeCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.visualStyle == .linewise {
            return kForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func kForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: Self.head), let lineAboveHead = AccessibilityTextElementAdaptor.lineFor(location: lineAtHead.start - 1) {
            var newHeadLocation = lineAboveHead.start + (AccessibilityTextElement.globalColumnNumber - 1)
            var globalColumnNumber: Int?
            
            // if the new head is over the line limit, we set it at the line limit,
            // and we will override the setting of the globalColumnNumber
            if newHeadLocation >= lineAboveHead.end {
                newHeadLocation = lineAboveHead.end - 1
                globalColumnNumber = AccessibilityTextElement.globalColumnNumber
            }
            
            if Self.head > Self.anchor, newHeadLocation > Self.anchor {
                element.selectedLength = (newHeadLocation - Self.anchor) + 1
            } else {
                element.caretLocation = newHeadLocation
                element.selectedLength = (Self.anchor - newHeadLocation) + 1
            }
            
            if globalColumnNumber != nil {
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber!
            }
        }
        
        element.selectedText = nil
        
        return element
    }
    
    private func kForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {        
        var newElement = element
        
        guard let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil
            
            return newElement
            
        }
        
        guard let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) else {
            newElement.selectedLength = element.characterLength
            newElement.selectedText = nil 
            
            return newElement
        }
                
        if lineAtHead.number > lineAtAnchor.number {
            newElement.selectedLength = lineAtHead.start - Self.anchor
            newElement.selectedText = nil
            
            return newElement
        }
        
        if let lineAboveHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number - 1) {
            newElement.caretLocation = lineAboveHead.start
            newElement.selectedLength = lineAtAnchor.end - lineAboveHead.start
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedText = nil
        
        return newElement
    }
    
}
