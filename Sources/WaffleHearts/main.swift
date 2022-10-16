import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct WaffleHearts: Website {
    enum SectionID: String, WebsiteSectionID {
        case about
        case recipes
        case howto
        case posts
        case links
    }

    struct ItemMetadata: WebsiteItemMetadata {
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://www.wafflehearts.com")!
    var name = "WaffleHearts"
    var description = ""
    var language: Language { .english }
    var imagePath: Path? { nil }
}

let wf = WaffleHearts()
try wf
    .publish(
        withTheme: .basic,
        additionalSteps: [
            .deploy(
                using: .gitHub("annebeaubien/annebeaubien.github.io", useSSH: true)
            )
        ]
    )
