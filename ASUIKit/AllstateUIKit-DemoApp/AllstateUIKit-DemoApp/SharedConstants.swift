//
//  SharedConstants.swift
//  AllstateUIKit-DemoApp
//

import UIKit

// Adobt to provide the Storyboard Id
protocol StoryboardIdentifierProtocol {
    static var storyboardID: String { get }
}

struct SharedConstants {
    // declare all available UI component
    enum UIComponent: String {
        case floatingRow
        case customFloatingRow
        case cards
        case tiles
        case navigationHeader
        case styleGuide
        case button
        case cardsPriority
        case loadingIndicator
        case statusHeader
        var title: String {
            switch self {
            case .floatingRow: return "Floating Row"
            case .customFloatingRow: return "Custom Floating Row"
            case .cards: return "Cards"
            case .tiles: return "Tiles"
            case .navigationHeader: return "Navigation Headers"
            case .styleGuide: return "Style Guide"
            case .button: return "Button"
            case .cardsPriority: return "Cards Priority"
            case .loadingIndicator: return "Loading Indicator"
            case .statusHeader: return "StatusHeader"
            }
        }
        var subTitle: String {
            return "->"
        }
        var leftIcon: UIImage? {
            return nil
        }
        var rightIcon: UIImage? {
            return nil
        }
        var storyboardIdentifier: String? {
            switch self {
            case .floatingRow: return FloatingRowViewController.storyboardID
            case .customFloatingRow: return CustomFloatingRowViewController.storyboardID
            case .cards: return CardsViewController.storyboardID
            case .tiles: return TileViewController.storyboardID
            case .navigationHeader: return NavigationViewController.storyboardID
            case .styleGuide: return StyleGuideLinesViewController.storyboardID
            case .button: return nil
            case .cardsPriority: return CardsPriorityController.storyboardID
            case .loadingIndicator: return LoadingIndicatorViewController.storyboardID
            case .statusHeader: return StatusHeaderViewController.storyboardID
            }
        }
    }
    static let allUIComponents: [UIComponent] = [.floatingRow, .customFloatingRow, .cards, .tiles,
                                                 .navigationHeader, .styleGuide, .button, .cardsPriority,
                                                 .loadingIndicator, .statusHeader]
    static let semiboldFont = UIFont(name: "SFProText-Semibold", size: 13)
}
