extension KeyboardStrategyNormalMode {
    
    // gross undo/redo for now until we understand the UndoManager API
    func controlRForAXElement() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, shift: true, command: true),
            KeyCombination(key: .right, shift: true)
        ]
    }
    
}
