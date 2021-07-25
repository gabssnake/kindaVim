protocol TextEngineProtocol {
    
    func beginningOfParagraphBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWordBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWORDBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWordForward(startingAt location: Int, in text: TextEngineText) -> Int
    func beginningOfWORDForward(startingAt location: Int, in text: TextEngineText) -> Int
    func endOfParagraphForward(startingAt location: Int, in text: TextEngineText) -> Int
    func endOfWordBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func endOfWORDBackward(startingAt location: Int, in text: TextEngineText) -> Int
    func endOfWordForward(startingAt location: Int, in text: TextEngineText) -> Int
    func endOfWORDForward(startingAt location: Int, in text: TextEngineText) -> Int
    func findNext(_ character: Character, after location: Int, in text: TextEngineTextObjectProtocol) -> Int?
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int?
    func firstNonBlank(in text: String) -> Int
    func firstNonBlankWithinLineLimit(in line: TextEngineLine) -> Int
    func innerQuotedString(using character: Character, startingAt location: Int, in text: String) -> Range<Int>?
    func innerWord(startingAt location: Int, in text: String) -> Range<Int>
    func nextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int
    func previousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int

}


protocol TextEngineTextObjectProtocol {
    
    var value: String { get }        
    var isEmpty: Bool { get }    
    var isNotEmpty: Bool { get }    
    var isOnlyALinefeedCharacter: Bool { get }
    
    func characterLengthForCharacter(at location: Int) -> Int
    func characterLengthForCharacter(before location: Int) -> Int
    
}


extension TextEngineTextObjectProtocol {

    var isEmpty: Bool {
        return value.isEmpty
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var isOnlyALinefeedCharacter: Bool {
        return value == "\n"
    }
    
    
    func characterLengthForCharacter(at location: Int) -> Int {
        return value.characterLengthForCharacter(at: location)
    }
    
    func characterLengthForCharacter(before location: Int) -> Int {
        return value.characterLengthForCharacter(before: location)
    }
    
}


struct TextEngineText: TextEngineTextObjectProtocol {

    let value: String

    var endLimit: Int {
        guard isNotEmpty else { return 0 }
        guard !isOnlyALinefeedCharacter else { return 0 }
        guard value.hasSuffix("\n") else { return value.utf16.distance(from: value.startIndex, to: value.index(before: value.endIndex)) }

        return value.utf16.distance(from: value.startIndex, to: value.endIndex)
    }
    
    
    init(from text: String) {
        value = text
    }

}


struct TextEngineLine: TextEngineTextObjectProtocol {
    
    var value: String
    let start: Int
    let end: Int
    
    var endLimit: Int {
        guard isNotEmpty else { return 0 }
        guard !isOnlyALinefeedCharacter else { return 0 }
        guard value.hasSuffix("\n") else { return value.utf16.distance(from: value.startIndex, to: value.index(before: value.endIndex)) }
            
        return value.utf16.distance(from: value.startIndex, to: value.index(value.endIndex, offsetBy: -2))                    
    }
    
    mutating func removeTrailingLinefeedIfAny() {
        if value.hasSuffix("\n") {
            value.removeLast()
        }    
    }
    
    mutating func addTrailingLinefeedIfNone() {
        if !value.hasSuffix("\n") {
            value.append("\n")
        }
    }
    
    
    init(from text: String) {
        start = 0
        end = text.utf16.count
        value = text
    }
    
    init(start: Int, end: Int, value: String) {
        self.start = start
        self.end = end
        self.value = value
    }
    
}


struct TextEngine: TextEngineProtocol {}


// Vim Text Engine types of move.
// always return a location.
// e.g. previousNonBlank: if it cannot find a non blank, then it returns 0 (start of line)
// rather than nil. so those funcs are not pure search funcs, they're more related
// to Vim ways of working.
extension TextEngine {
    
    // this one doesn't actually need the utf16 because it's particular as it's only checking for a first non blank character
    // whether it is an emoji or not. still for consistency we will utf16 that shit.
    func firstNonBlank(in text: String) -> Int {
        guard let characterIndex = text.firstIndex(where: { !$0.isWhitespaceButNotNewline }) else { return text.utf16.count }
        
        return text.utf16.distance(from: text.startIndex, to: characterIndex)
    }

    // see firstNonBlank above for blah blah
    func firstNonBlankWithinLineLimit(in line: TextEngineLine) -> Int {
        let value = line.value
        guard let characterIndex = value.firstIndex(where: { !$0.isWhitespace }) else { return line.endLimit }
        
        return value.utf16.distance(from: value.startIndex, to: characterIndex)
    }
    
    func innerQuotedString(using quote: Character, startingAt location: Int, in text: String) -> Range<Int>? {
        guard !text.isEmpty else { return nil }
        
        guard let characterAtLocationIndex = text.utf16.index(text.startIndex, offsetBy: location, limitedBy: text.index(before: text.endIndex)) else { return nil }
        let characterAtLocationText = text[characterAtLocationIndex]
        
        if characterAtLocationText == quote {
            let searchEndIndex = text.utf16.index(text.startIndex, offsetBy: location)
            let numberOfQuotesBeforeCurrentQuote = text[..<searchEndIndex].filter { $0 == quote }.utf16.count
            
            if numberOfQuotesBeforeCurrentQuote % 2 == 0 {
                if let nextQuoteLocation = findNext(quote, after: location, in: TextEngineText(from: text)) {
                    return (location + 1)..<nextQuoteLocation
                }
                
                return nil
            }
        }
                
        if let previousQuoteLocation = findPrevious(quote, before: location, in: text) {
            if let nextQuoteLocation = findNext(quote, after: location - 1, in: TextEngineText(from: text)) {
                return (previousQuoteLocation + 1)..<nextQuoteLocation
            }
            
            return nil
        }
        
        if let firstQuoteLocation = findFirst(quote, in: text), let secondQuoteLocation = findSecond(quote, in: text) {
            return (firstQuoteLocation + 1)..<secondQuoteLocation
        }
        
        return nil
    }    

    func innerWord(startingAt location: Int, in text: String) -> Range<Int> {
        guard !text.isEmpty else { return 0..<0 }
        
        // weird Vim move for that one: if on last empty line, iw selects the linefeed and last character of the previous line before the linefeed
        guard let characterAtLocationIndex = text.utf16.index(text.startIndex, offsetBy: location, limitedBy: text.index(before: text.endIndex)) else { return ((text.utf16.count - 1) - text.characterLengthForCharacter(before: location - 1))..<text.utf16.count }
        let characterAtLocationText = text[characterAtLocationIndex]

        if characterAtLocationText == " " {
            let previousNonBlankLocation = findPreviousNonBlank(startingAt: location, in: text) ?? 0
            let nextNonBlankLocation = findNextNonBlank(after: location, in: text) ?? text.utf16.count  
            
            guard previousNonBlankLocation != 0 else { return 0..<nextNonBlankLocation }
            
            return (previousNonBlankLocation + text.characterLengthForCharacter(at: previousNonBlankLocation))..<nextNonBlankLocation
        }
 
        let beginningOfWordLocation = beginningOfWordBackward(startingAt: location + text.characterLengthForCharacter(at: location), in: TextEngineText(from: text))
        let endOfWordLocation = endOfWordForward(startingAt: location - text.characterLengthForCharacter(before: location), in: TextEngineText(from: text))

        return beginningOfWordLocation..<(endOfWordLocation + text.characterLengthForCharacter(at: endOfWordLocation))
    }
    
    func nextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int {
        let locationIndex = text.index(text.startIndex, offsetBy: location)
        let searchText = String(text[locationIndex...])

        if let rightBracketFoundLocation = findNextUnmatched(bracket, after: 0, in: searchText) {
            return location + rightBracketFoundLocation
        }
        
        return location
    }    
    
    func previousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int {
        let locationIndex = text.index(text.startIndex, offsetBy: location)
        let searchText = String(text[..<locationIndex])
        
        if let leftBracketFoundLocation = findPreviousUnmatched(bracket, before: location, in: searchText) {
            return leftBracketFoundLocation
        }
        
        return location
    }

}


// here we have the helper funcs that may return nil
// they help for the other Vim Text Engine moves,
// or the AccessibilityStrategy moves themselves.
// they may return nil when they cannot find what is being looking for
extension TextEngine {
    
    private func findPreviousUnmatched(_ bracket: Character, before location: Int, in text: String) -> Int? {
        var pairingBracket: Character
        
        switch bracket {
        case "{":
            pairingBracket = "}"
        case "(":
            pairingBracket = ")"
        case "[":
            pairingBracket = "]"
        default:
            return nil
        }
        
        let searchEndIndex = text.index(text.startIndex, offsetBy: location)
        
        guard let lastLeftBracketFoundIndex = text[..<searchEndIndex].lastIndex(of: bracket) else { return nil }
        
        if let lastRightBracketFoundIndex = text[lastLeftBracketFoundIndex...].lastIndex(of: pairingBracket) {
            let lastLeftBracketFoundLocation = text.distance(from: text.startIndex, to: lastLeftBracketFoundIndex)
            
            return findPreviousUnmatched(bracket, before: lastLeftBracketFoundLocation, in: String(text[..<lastRightBracketFoundIndex]))
        }
        
        return text.distance(from: text.startIndex, to: lastLeftBracketFoundIndex)
    }
    
    private func findNextUnmatched(_ bracket: Character, after location: Int, in text: String) -> Int? {
        var pairingBracket: Character
        
        switch bracket {
        case "}":
            pairingBracket = "{"
        case ")":
            pairingBracket = "("
        case "]":
            pairingBracket = "["
        default:
            return nil
        }
        
        guard let searchStartIndex = text.index(text.startIndex, offsetBy: location + 1, limitedBy: text.endIndex) else { return nil }
        
        guard let firstRightBracketFoundIndex = text[searchStartIndex...].firstIndex(of: bracket) else { return nil }
        
        if let firstLeftBracketFoundIndex = text[text.index(after: text.startIndex)..<firstRightBracketFoundIndex].firstIndex(of: pairingBracket) {
            let distanceBetweenLeftAndRightBracketsFound = text.distance(from: firstLeftBracketFoundIndex, to: firstRightBracketFoundIndex)
            let distanceFromStartToFirstLeftBracketFound = text.distance(from: text.startIndex, to: firstLeftBracketFoundIndex)
            
            guard let nextRightBracketFoundLocation = findNextUnmatched(bracket, after: distanceBetweenLeftAndRightBracketsFound, in: String(text[firstLeftBracketFoundIndex...])) else { return nil } 
            
            return distanceFromStartToFirstLeftBracketFound + nextRightBracketFoundLocation
        }
        
        return text.distance(from: text.startIndex, to: firstRightBracketFoundIndex)               
    }
    
    private func findFirst(_ character: Character, in text: String) -> Int? {
        guard let characterIndex = text.firstIndex(of: character) else { return nil }
        
        return text.utf16.distance(from: text.startIndex, to: characterIndex)
    }
    
    func findLast(_ character: Character, in text: String) -> Int? {
        guard let characterIndex = text.lastIndex(of: character) else { return nil }
        
        return text.utf16.distance(from: text.startIndex, to: characterIndex)
    }
    
    func findNext(_ character: Character, after location: Int, in text: TextEngineTextObjectProtocol) -> Int? {
        let characterLengthAtLocation = text.characterLengthForCharacter(at: location)
        
        let value = text.value
        guard let searchStartIndex = value.utf16.index(value.startIndex, offsetBy: location + characterLengthAtLocation, limitedBy: value.endIndex) else { return nil }
        let searchEndIndex = value.endIndex
        
        guard let characterFoundLocation = findFirst(character, in: String(value[searchStartIndex..<searchEndIndex])) else { return nil }
        
        return (location + characterLengthAtLocation) + characterFoundLocation
    }
    
    // utf16 no super needed here as we stop before the non blank character
    // but using it for consistency. looks beautiful
    func findNextNonBlank(after location: Int, in text: String) -> Int? {
        let anchorIndex = text.utf16.index(text.startIndex, offsetBy: location)
        let endIndex = text.endIndex
        
        for index in text[anchorIndex..<endIndex].indices {
            guard index != text.index(before: endIndex) else { return nil }
            let nextIndex = text.index(after: index)
            
            if text[nextIndex].isWhitespaceButNotNewline {
                continue
            }
            
            return text.utf16.distance(from: text.startIndex, to: nextIndex)
        }
        
        return nil
    }
    
    func findPrevious(_ character: Character, before location: Int, in text: String) -> Int? {
        let searchStartIndex = text.startIndex
        guard let searchEndIndex = text.utf16.index(text.startIndex, offsetBy: location, limitedBy: text.endIndex) else { return nil }
        
        guard let characterFoundLocation = findLast(character, in: String(text[searchStartIndex..<searchEndIndex])) else { return nil }
        
        return characterFoundLocation
    }
    
    func findPreviousNonBlank(startingAt location: Int, in text: String) -> Int? {
        
        guard let anchorIndex = text.utf16.index(text.startIndex, offsetBy: location + text.characterLengthForCharacter(at: location), limitedBy: text.endIndex) else { return nil }
        let startIndex = text.startIndex
        
        for index in text[..<anchorIndex].indices.reversed() {
            guard index != startIndex else { return nil }
            let previousIndex = text.index(before: index)
            
            if text[previousIndex].isWhitespaceButNotNewline {
                continue
            }
            
            return text.utf16.distance(from: startIndex, to: previousIndex)
        }
        
        return nil
    }
    
    private func findSecond(_ character: Character, in text: String) -> Int? {
        guard let firstCharacterIndex = text.firstIndex(of: character) else { return nil }
        let nextToFirstCharacterIndex = text.index(after: firstCharacterIndex)
        guard let secondCharacterLocation = findFirst(character, in: String(text[nextToFirstCharacterIndex...])) else { return nil }
        
        return text.utf16.distance(from: text.startIndex, to: nextToFirstCharacterIndex) + secondCharacterLocation
    }
            
}
