extension Character {
    
    var isCharacterThatConstitutesAVimWord: Bool {
        return self.isLetter || self.isNumber || self == "_"
    }
    
    var isPunctuationButNotUnderscore: Bool {
        return self.isPunctuation && self != "_"
    }
    
    var isWhitespaceButNotNewline: Bool { 
        return self.isWhitespace && !self.isNewline
    }
    
}
