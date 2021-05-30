protocol TextEngineProtocol {
    
    func wordBackward(for location: Int, playground text: String) -> Int
    func wordForward(for location: Int, playground text: String) -> Int
    
}


struct TextEngine: TextEngineProtocol {
    
    func wordBackward(for location: Int, playground text: String) -> Int {
        let endAnchor = text.index(text.startIndex, offsetBy: location)
        let start = text.startIndex
        
        for index in text[start..<endAnchor].indices.reversed() {
            guard index != text.startIndex else { return 0 }
            let previousIndex = text.index(before: index)
            
            if text[index] == "_" {
                if text[previousIndex].isLetter {
                    continue
                }
            }
                        
            if text[index].isLetter {
                if text[previousIndex] == "_" {
                    continue
                }
                
                if text[previousIndex].isWhitespace || text[previousIndex].isPunctuation {
                    return text.distance(from: start, to: index)
                }
            }
            
            if text[index].isPunctuation {
                if !text[previousIndex].isPunctuation {
                    return text.distance(from: start, to: index)
                }
            }
            
            if text[index].isNewline {
                if text[previousIndex].isNewline {
                    return text.distance(from: start, to: index)
                }
            }
            
        }
        
        return location
    }

    func wordForward(for location: Int, playground text: String) -> Int {
        let start = text.index(text.startIndex, offsetBy: location)
        let end = text.endIndex

        let locationIndex = text.index(text.startIndex, offsetBy: location)

        for index in text[start..<end].indices {
            if index == text.index(before: text.endIndex) {
                return text.distance(from: text.startIndex, to: text.index(before: text.endIndex)) 
            }
            
            if text[index] == "_" {
                continue
            }

            if text[index].isNewline {
                let nextIndex = text[start..<end].index(after: index)
                    
                if text[nextIndex].isNewline || !text[nextIndex].isWhitespace {
                    return text.distance(from: text.startIndex, to: text.index(after: index))
                } else {
                    continue
                }
            }

            if text[index].isWhitespace {
                let nextIndex = text[start..<end].index(after: index)

                if text[nextIndex].isWhitespace {
                    continue
                } else {
                    return text.distance(from: text.startIndex, to: text.index(after: index))
                }
            }

            if text[index].isPunctuation {
                if text[locationIndex].isPunctuation {
                    continue
                } else {
                    return text.distance(from: text.startIndex, to: index)
                }
            }

            if text[index].isLetter {
                if text[locationIndex].isLetter {
                    continue
                } else {
                    return text.distance(from: text.startIndex, to: index)
                }
            }
        }

        return location
    }

}
