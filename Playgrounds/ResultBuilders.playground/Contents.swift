import Foundation

struct MenuItem: CustomStringConvertible {
    let title: String
    let isEnabled: Bool
    var description: String { isEnabled ? title : "\(title) (disabled)" }
}

@resultBuilder
enum MenuBuilder {
    static func buildBlock(_ components: [MenuItem]...) -> [MenuItem] {
        components.flatMap { $0 }
    }

    static func buildExpression(_ expression: MenuItem) -> [MenuItem] { [expression] }
    static func buildOptional(_ component: [MenuItem]?) -> [MenuItem] { component ?? [] }
    static func buildEither(first component: [MenuItem]) -> [MenuItem] { component }
    static func buildEither(second component: [MenuItem]) -> [MenuItem] { component }
    static func buildArray(_ components: [[MenuItem]]) -> [MenuItem] {
        components.flatMap { $0 }
    }
}

func build(@MenuBuilder _ content: () -> [MenuItem]) -> [MenuItem] { content() }

let menu = build {
    MenuItem(title: "Oil change", isEnabled: true)
    if true {
        MenuItem(title: "Detailing", isEnabled: true)
    }
    for upgrade in ["Ceramic coat", "Paint protection"] {
        MenuItem(title: upgrade, isEnabled: true)
    }
}

menu.forEach { print($0) }
