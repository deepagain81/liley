//
//  StyleGuideLinesViewController.swift
//  AllstateUIKit-DemoApp

import Foundation
import UIKit

class StyleGuideLinesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension StyleGuideLinesViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "StyleViewControllers"
}
}
