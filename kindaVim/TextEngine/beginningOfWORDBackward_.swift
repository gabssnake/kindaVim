extension TextEngine {
    
    func beginningOfWORDBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        guard text.isNotEmpty else { return 0 }
        
        let value = text.value
        
        let anchorIndex = value.utf16.index(value.startIndex, offsetBy: location)
        let startIndex = value.startIndex
        
        for index in value[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            let previousIndex = value.index(before: index)
            
            if value[index].isCharacterThatConstitutesAVimWORD {
                if value[previousIndex].isCharacterThatConstitutesAVimWORD {
                    continue
                }
            }
            
            if value[index].isWhitespaceButNotNewline {
                continue
            }
            
            if value[index].isNewline {
                if !value[previousIndex].isNewline {
                    continue
                }
            }
            
            return value.utf16.distance(from: startIndex, to: index)
        }        
        
        return location
    }
    
}
