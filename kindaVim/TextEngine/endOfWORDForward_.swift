extension TextEngine {
    
    func endOfWORDForward(startingAt location: Int, in text: TextEngineText) -> Int {
        guard text.isNotEmpty else { return 0 }
        
        let value = text.value        
        guard let anchorIndex = value.index(value.startIndex, offsetBy: location + 1, limitedBy: value.endIndex) else { return text.endLimit }
        let endIndex = value.endIndex
        
        for index in value[anchorIndex..<endIndex].indices {
            guard index != value.index(before: endIndex) else { return text.endLimit }
            let nextIndex = value.index(after: index)
            
            if value[index].isCharacterThatConstitutesAVimWORD {
                if value[nextIndex].isCharacterThatConstitutesAVimWORD {
                    continue
                }
            }
            
            if value[index].isWhitespaceButNotNewline {
                if value[nextIndex].isWhitespace || value[nextIndex].isCharacterThatConstitutesAVimWord || value[nextIndex].isPunctuationButNotUnderscore || value[nextIndex].isSymbol {
                    continue
                }
            }
            
            if value[index].isNewline {
                continue
            }
            
            return value.distance(from: value.startIndex, to: index)
        }
        
        return location
    }
    
}
