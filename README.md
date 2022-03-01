<h1 align="center">kindaVim</h1>

<p align="center">
    <a href="https://github.com/godbout/kindaVim/actions">
        <img src="https://github.com/godbout/kindaVim/actions/workflows/main.yml/badge.svg"/>
    </a>
    <a href="https://codecov.io/gh/godbout/kindaVim">
        <img src="https://codecov.io/gh/godbout/kindaVim/branch/master/graph/badge.svg?token=R5gBWyB21D"/>
    </a>
</p>

# APP CORE AND KINDAVIMENGINE CORE

this holds the source of the App Core and the kindaVim Engine Core. the rest of kindaVim is split into different packages, all open source:

* [AXEngine](https://github.com/godbout/AXEngine)
* [AccessibilityStrategy](https://github.com/godbout/AccessibilityStrategy)
* [KeyboardStrategy](https://github.com/godbout/KeyboardStrategy)
* [Commands](https://github.com/godbout/Commands)
* [KeyCombination](https://github.com/godbout/KeyCombination)
* [Common](https://github.com/godbout/Common)

the `License.swift` file is not included. this is the file that contains private and obfuscated API Keys and data regarding license status.
you can provide your own implementation, or just remove any reference in the source code.
