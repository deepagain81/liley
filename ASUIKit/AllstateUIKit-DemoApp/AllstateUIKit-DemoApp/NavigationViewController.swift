//
//  NavigationViewController.swift
//  AllstateUIKit-DemoApp
//

import Foundation
import UIKit
import AllstateUIKit

class NavigationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NavigationViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "NavigationViewControllers"
    }
}
