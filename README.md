<h1 align="center">iOS Object Oriented Programming</h1>

<p align="center">
  Hands-on, test-covered Swift examples of classic OOP and modern Swift language
  features for iOS developers.
</p>

<p align="center">
  <a href="https://swift.org"><img alt="Swift" src="https://img.shields.io/badge/Swift-6.3-FA7343?logo=swift&logoColor=white"></a>
  <a href="https://developer.apple.com/xcode/"><img alt="Xcode" src="https://img.shields.io/badge/Xcode-26.6-147EFB?logo=xcode&logoColor=white"></a>
  <img alt="Platforms" src="https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20visionOS-lightgrey">
  <a href="https://www.swift.org/package-manager/"><img alt="SPM" src="https://img.shields.io/badge/SPM-compatible-brightgreen"></a>
  <a href="https://github.com/halilozel1903/iOSObjectOrientedProgramming/actions/workflows/ci.yml"><img alt="CI" src="https://github.com/halilozel1903/iOSObjectOrientedProgramming/actions/workflows/ci.yml/badge.svg"></a>
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

## About

This repository teaches object oriented programming **and** modern Swift through
small, focused and **executable** examples. Every concept exists twice:

- as a **Swift package source** under `Sources/ObjectOrientedProgramming` that
  compiles in the Swift 6 language mode and is verified by unit tests, and
- as an **Xcode playground** under `Playgrounds/` that you can run line by line
  and watch in the results sidebar.

The code is deliberately small, documented and free of deprecated APIs, so it
works as a reference, interview prep material or course companion.

## Covered Topics

### Classic OOP

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

### Modern Swift

| Topic | Source | Playground |
| --- | --- | --- |
| Protocol-oriented design with generics and associated types | `Sources/ObjectOrientedProgramming/ProtocolOrientedGenerics.swift` | `Playgrounds/ProtocolOrientedGenerics.playground` |
| Property wrappers (`wrappedValue` / `projectedValue`) | `Sources/ObjectOrientedProgramming/PropertyWrappers.swift` | `Playgrounds/PropertyWrappers.playground` |
| Result builders and declarative DSLs | `Sources/ObjectOrientedProgramming/ResultBuilders.swift` | `Playgrounds/ResultBuilders.playground` |
| Freestanding macros (`#fileID`, `#function`, `#line`, `#column`) | `Sources/ObjectOrientedProgramming/Macros.swift` | `Playgrounds/Macros.playground` |
| Generics constraints, `where` clauses, primary associated types | `Sources/ObjectOrientedProgramming/GenericsConstraints.swift` | `Playgrounds/GenericsConstraints.playground` |
| Typed throws, `Result` and domain errors | `Sources/ObjectOrientedProgramming/ErrorHandling.swift` | `Playgrounds/ErrorHandling.playground` |
| `Codable` with custom keys and nested types | `Sources/ObjectOrientedProgramming/CodableExamples.swift` | `Playgrounds/CodableExamples.playground` |
| Structured concurrency: task groups, `async let`, `AsyncStream` | `Sources/ObjectOrientedProgramming/StructuredConcurrency.swift` | `Playgrounds/StructuredConcurrency.playground` |
| `Sendable`, `@unchecked Sendable`, `nonisolated`, `isolated` | `Sources/ObjectOrientedProgramming/SendableIsolation.swift` | `Playgrounds/SendableIsolation.playground` |

## Requirements

| Tool | Version |
| --- | --- |
| Swift | 6.3 or newer |
| Xcode | 26.6 or newer (for playgrounds) |
| Minimum deployment targets | iOS 26, macOS 26, tvOS 26, watchOS 26, visionOS 26 |
| SwiftLint (optional) | 0.60 or newer |

The package is platform independent: `swift build` and `swift test` also work
with a Swift 6.3 toolchain on Linux.

> **Toolchain note:** Swift 6.4 and Apple platform 27 are already released, but
> GitHub-hosted `xcode-27` runners are still a public preview. This repository
> stays on Swift 6.3 / platform 26 so CI remains on GA `macos-26` images with
> Xcode 26.6.

## Getting Started

### Clone

```bash
git clone https://github.com/halilozel1903/iOSObjectOrientedProgramming.git
cd iOSObjectOrientedProgramming
```

### Build and test (CLI)

This repository is a standard Swift package (`Package.swift`,
`swift-tools-version: 6.3`). From the repo root:

```bash
swift --version   # expect Swift 6.3 or newer
swift build
swift test
```

| Host | Toolchain | Notes |
| --- | --- | --- |
| **macOS** | Xcode 26.6+ (Swift 6.3) | Matches CI (`macos-26` + `/Applications/Xcode_26.6.app`). You can also open the package and press <kbd>⌘</kbd> + <kbd>U</kbd>: `open Package.swift` |
| **Linux** | Official Swift 6.3.x toolchain (CI uses the `swift:6.3.3` container) | Install from [swift.org](https://www.swift.org/install/), then run the same `swift build` / `swift test` commands. Playgrounds require macOS + Xcode and are skipped on Linux. |

A captured Linux session (Swift 6.3.3, 41 tests / 14 suites) lives under
[`docs/cli/swift-build-test-linux.png`](docs/cli/swift-build-test-linux.png):

<p align="center">
  <img src="docs/cli/swift-build-test-linux.png" alt="swift build and swift test on Linux with Swift 6.3.3" width="720">
</p>

Minimum Apple deployment targets in `Package.swift` are **platform 26**
(iOS / macOS / tvOS / watchOS / visionOS). Those constraints matter for
Apple-platform consumers of the library; the package sources themselves are
Foundation-only and compile on Linux without UIKit or AppKit.

### Playgrounds in Xcode

Each topic under `Playgrounds/` is an Xcode playground that mirrors the
matching file in `Sources/ObjectOrientedProgramming/`. Playgrounds need
**macOS with Xcode 26.6 or newer** (they do not run in the Linux Swift
toolchain).

```bash
# Open the whole package in Xcode
open Package.swift

# Or open one playground directly
open Playgrounds/Classes.playground
open Playgrounds/ProtocolOrientedGenerics.playground
```

In Xcode: select a playground page, press <kbd>⌘</kbd> + <kbd>⇧</kbd> +
<kbd>↩</kbd> (Run Playground) or use Editor → Run Playground, and watch
values appear in the results sidebar. Prefer the package sources +
`swift test` when you want assertions; use playgrounds for interactive
exploration.

### Linting and formatting

Optional local checks (also run in CI on macOS):

```bash
swiftlint lint --strict
swift format lint --recursive --strict Sources Tests Playgrounds Package.swift
swift format --in-place --recursive Sources Tests Playgrounds Package.swift
```

## Diagrams

There is no app UI in this package, so documentation visuals are topic maps
and CLI captures rather than simulator screenshots:

| Asset | Description |
| --- | --- |
| [`docs/diagrams/oop-topic-map.png`](docs/diagrams/oop-topic-map.png) | Inheritance and polymorphism hierarchies from the package sources |
| [`docs/diagrams/project-structure.png`](docs/diagrams/project-structure.png) | Repository layout (sources, tests, playgrounds, docs) |
| [`docs/cli/swift-build-test-linux.png`](docs/cli/swift-build-test-linux.png) | Real `swift build` / `swift test` output on Linux · Swift 6.3.3 |

<p align="center">
  <img src="docs/diagrams/oop-topic-map.png" alt="Classic OOP topic map: Animal and MotorVehicle hierarchies plus Shape protocol polymorphism" width="720">
</p>

<p align="center">
  <img src="docs/diagrams/project-structure.png" alt="Repository structure diagram for the Swift 6.3 package" width="720">
</p>

## Project Structure

```text
.
├── Package.swift                       # Swift 6.3 package manifest (Swift 6 language mode)
├── Sources/
│   └── ObjectOrientedProgramming/
│       ├── Classes.swift               # Classes, encapsulation, value vs. reference
│       ├── Enumerations.swift          # Enumerations, designated & convenience inits
│       ├── Inheritance.swift           # Animal hierarchy, overriding, dynamic dispatch
│       ├── VehicleInheritance.swift    # Vehicle hierarchy with overridden behaviour
│       ├── Polymorphism.swift          # Shape protocol and existential collections
│       ├── VehicleFleet.swift          # Actor based, data-race free state
│       ├── ProtocolOrientedGenerics.swift  # Associated types and opaque inventories
│       ├── PropertyWrappers.swift      # @Clamped wrapper and projected values
│       ├── ResultBuilders.swift        # Menu DSL with @resultBuilder
│       ├── Macros.swift                # SourceLocation via freestanding macros
│       ├── GenericsConstraints.swift   # where clauses and primary associated types
│       ├── ErrorHandling.swift         # Typed throws and Result APIs
│       ├── CodableExamples.swift       # JSON round-trips with CodingKeys
│       ├── StructuredConcurrency.swift # Task groups, async let, AsyncStream
│       └── SendableIsolation.swift     # Sendable, nonisolated, isolated parameters
├── Tests/
│   └── ObjectOrientedProgrammingTests/ # swift-testing suite per topic
├── Playgrounds/                        # One Xcode playground per topic
├── docs/
│   ├── diagrams/                       # Topic and structure diagrams
│   └── cli/                            # Captured swift build / swift test output
├── .swiftlint.yml                      # SwiftLint configuration
├── .swift-format                       # swift-format configuration
├── LICENSE                             # MIT license
└── .github/workflows/ci.yml            # Build, test and lint on every push / PR
```

## Roadmap

Ideas for follow-up lessons (contributions welcome):

- Custom attached macros via a SwiftPM macro target and SwiftSyntax
- `~Copyable` / consuming moves for high-performance value types
- Observation (`@Observable`) on Apple platforms
- Distributed actors and `AsyncSequence` back-pressure patterns
- Swift Testing traits, parameterized tests and tags

## Contributing

Contributions are welcome.

1. Fork the repository and create a branch: `git checkout -b feat/my-topic`.
2. Keep the educational style: small types, documented intent, no deprecated APIs.
3. Add a matching source file, playground and `swift-testing` suite for every new topic.
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
