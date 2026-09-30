import Foundation

/// Declarative menu entries produced by ``MenuBuilder``.
public struct MenuItem: Sendable, Equatable, CustomStringConvertible {
    public let title: String
    public let isEnabled: Bool

    public init(_ title: String, isEnabled: Bool = true) {
        self.title = title
        self.isEnabled = isEnabled
    }

    public var description: String {
        isEnabled ? title : "\(title) (disabled)"
    }
}

/// A result builder that turns a nested DSL into a flat `[MenuItem]` list.
/// Shows `buildBlock`, `buildOptional`, `buildEither` and `buildArray`.
@resultBuilder
public enum MenuBuilder {
    public static func buildBlock(_ components: [MenuItem]...) -> [MenuItem] {
        components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: MenuItem) -> [MenuItem] {
        [expression]
    }

    public static func buildExpression(_ expression: [MenuItem]) -> [MenuItem] {
        expression
    }

    public static func buildOptional(_ component: [MenuItem]?) -> [MenuItem] {
        component ?? []
    }

    public static func buildEither(first component: [MenuItem]) -> [MenuItem] {
        component
    }

    public static func buildEither(second component: [MenuItem]) -> [MenuItem] {
        component
    }

    public static func buildArray(_ components: [[MenuItem]]) -> [MenuItem] {
        components.flatMap { $0 }
    }
}

/// Builds a garage service menu with the ``MenuBuilder`` DSL.
public enum GarageMenu {
    public static func make(includeDetailing: Bool, vipCustomer: Bool) -> [MenuItem] {
        build {
            MenuItem("Oil change")
            MenuItem("Tire rotation")

            if includeDetailing {
                MenuItem("Interior detailing")
            }

            if vipCustomer {
                MenuItem("Complimentary wash")
            } else {
                MenuItem("Wash", isEnabled: false)
            }

            for upgrade in ["Ceramic coat", "Paint protection"] {
                MenuItem(upgrade)
            }
        }
    }

    public static func build(@MenuBuilder _ content: () -> [MenuItem]) -> [MenuItem] {
        content()
    }
}
