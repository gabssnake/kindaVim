@testable import kindaVim
import Foundation

class TextEngineMock: TextEngineProtocol {
    
    var functionCalled = ""
    
    func findFirst(_ character: Character, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
    }
    
    func findSecond(_ character: Character, in text: String) -> Int? {
        functionCalled = #function
        
        return nil 
    }
    
    func wordBackward(for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
    func wordForward(for location: Int, playground text: String) -> Int {
        functionCalled = #function
        
        return location
    }
    
}
