extension TextEngine {
    
    func beginningOfWordBackward(startingAt location: Int, in text: TextEngineText) -> Int {
        let value = text.value
        
        let anchorIndex = value.index(value.startIndex, offsetBy: location)
        let startIndex = value.startIndex
        
        for index in value[startIndex..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return 0 }
            let previousIndex = value.index(before: index)
            
            if value[index].isCharacterThatConstitutesAVimWord {
                if value[previousIndex].isCharacterThatConstitutesAVimWord {
                    continue
                }
            }
            
            if value[index].isPunctuationButNotUnderscore {
                if value[previousIndex].isPunctuationButNotUnderscore {
                    continue
                }
            }
            
            if value[index].isSymbol {
                if value[previousIndex].isSymbol || value[previousIndex].isPunctuationButNotUnderscore {
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
            
            return value.distance(from: startIndex, to: index)
        }        
        
        return location
    }
    
}
