import Defaults


extension Defaults.Keys {
    
    static let toggleHazeOverWindow = Key<Bool>("toggleHazeOverWindow", default: true)
    static let showCharactersTyped = Key<Bool>("showCharactersTyped", default: false)
    static let useCustomShortcutToEnterNormalMode = Key<Bool>("useCustomShortcutToEnterNormalMode", default: false)
    static let appsToIgnore = Key<Array<String>>("appsToIgnore", default: [
        "com.sublimetext.4",
        "com.googlecode.iterm2",
        "com.microsoft.VSCode",
        "com.jetbrains.PhpStorm",
        "com.github.atom"
    ])
    static let appsForWhichToEnforceKeyboardStrategy = Key<Array<String>>("appsForWhichToEnforceKeyboardStrategy", default: [
        "com.apple.Safari"
    ])
       
}