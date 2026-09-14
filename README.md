<h1 align="center">iOS Object Oriented Programming</h1>

<p align="center">
  Hands-on, test-covered Swift examples of the core object oriented programming concepts for iOS developers.
</p>

<p align="center">
  <a href="https://swift.org"><img alt="Swift" src="https://img.shields.io/badge/Swift-6.2-FA7343?logo=swift&logoColor=white"></a>
  <a href="https://developer.apple.com/xcode/"><img alt="Xcode" src="https://img.shields.io/badge/Xcode-26-147EFB?logo=xcode&logoColor=white"></a>
  <img alt="Platforms" src="https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20visionOS-lightgrey">
  <a href="https://www.swift.org/package-manager/"><img alt="SPM" src="https://img.shields.io/badge/SPM-compatible-brightgreen"></a>
  <a href="https://github.com/halilozel1903/iosobjectorientedprogramming/actions/workflows/ci.yml"><img alt="CI" src="https://github.com/halilozel1903/iosobjectorientedprogramming/actions/workflows/ci.yml/badge.svg"></a>
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

## About

This repository teaches object oriented programming in Swift through small, focused and
**executable** examples. Every concept exists twice:

- as a **Swift package target** (`Sources/ObjectOrientedProgramming`) that is compiled in the
  Swift 6 language mode and verified by unit tests, and
- as an **Xcode playground** (`Playgrounds/`) that you can run line by line to watch the
  behaviour in the results sidebar.

The code is deliberately small, documented and free of deprecated APIs, so it can be used as a
reference or as course material.

## Covered Topics

| Topic | Source | Playground |
| --- | --- | --- |
| Classes, stored properties, methods, encapsulation | `Sources/ObjectOrientedProgramming/Classes.swift` | `Playgrounds/Classes.playground` |
| Value vs. reference semantics (struct vs. class) | `Sources/ObjectOrientedProgramming/Classes.swift` | `Playgrounds/Classes.playground` |
| Enumerations, raw values, `CaseIterable`, computed properties | `Sources/ObjectOrientedProgramming/Enumerations.swift` | `Playgrounds/Enumerations.playground` |
| Designated and convenience initializers | `Sources/ObjectOrientedProgramming/Enumerations.swift` | `Playgrounds/Enumerations.playground` |
| Inheritance, `override`, multi-level hierarchies, dynamic dispatch | `Sources/ObjectOrientedProgramming/Inheritance.swift` | `Playgrounds/Inheritance.playground` |
| Subclassing with shared state and overridden behaviour | `Sources/ObjectOrientedProgramming/VehicleInheritance.swift` | `Playgrounds/VehicleInheritance.playground` |
| Polymorphism with protocols and `any` existentials | `Sources/ObjectOrientedProgramming/Polymorphism.swift` | `Playgrounds/Polymorphism.playground` |
| Actors: reference types with compiler-checked isolation | `Sources/ObjectOrientedProgramming/VehicleFleet.swift` | `Playgrounds/VehicleFleet.playground` |

## Requirements

| Tool | Version |
| --- | --- |
| Swift | 6.2 or newer |
| Xcode | 26 or newer |
| Minimum deployment targets | iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2 |
| SwiftLint (optional) | 0.60 or newer |

The package is platform independent, so `swift build` and `swift test` also work with a Swift 6
toolchain on Linux.

## Getting Started

Clone the repository:

```bash
git clone https://github.com/halilozel1903/iosobjectorientedprogramming.git
cd iosobjectorientedprogramming
```

Build and run the tests from the command line:

```bash
swift build
swift test
```

Or open the package in Xcode and press <kbd>⌘</kbd> + <kbd>U</kbd>:

```bash
open Package.swift
```

To explore a single concept interactively, open any playground:

```bash
open Playgrounds/Inheritance.playground
```

### Linting and Formatting

```bash
swiftlint lint --strict
swift format lint --recursive --strict Sources Tests Playgrounds Package.swift
swift format --in-place --recursive Sources Tests Playgrounds Package.swift
```

## Project Structure

```text
.
├── Package.swift                       # Swift 6.2 package manifest (Swift 6 language mode)
├── Sources/
│   └── ObjectOrientedProgramming/
│       ├── Classes.swift               # Classes, encapsulation, value vs. reference semantics
│       ├── Enumerations.swift          # Enumerations, designated & convenience initializers
│       ├── Inheritance.swift           # Animal hierarchy, overriding, dynamic dispatch
│       ├── VehicleInheritance.swift    # Vehicle hierarchy with overridden behaviour
│       ├── Polymorphism.swift          # Shape protocol and existential collections
│       └── VehicleFleet.swift          # Actor based, data-race free state
├── Tests/
│   └── ObjectOrientedProgrammingTests/ # swift-testing suites for every topic
├── Playgrounds/                        # One Xcode playground per topic
├── .swiftlint.yml                      # SwiftLint configuration
├── .swift-format                       # swift-format configuration
└── .github/workflows/ci.yml            # Build, test and lint on every push / pull request
```

## Contributing

Contributions are welcome.

1. Fork the repository and create a branch: `git checkout -b feat/my-topic`.
2. Keep the educational style: small types, documented intent, no deprecated APIs.
3. Add or update a test in `Tests/ObjectOrientedProgrammingTests` for every behaviour change.
4. Make sure everything passes locally:

```bash
swift test
swiftlint lint --strict
swift format lint --recursive --strict Sources Tests Playgrounds Package.swift
```

5. Use conventional commit subjects (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`).
6. Open a pull request against `master` describing what you changed and why.

## License

This project is released under the MIT License. See [LICENSE](LICENSE) for details.
