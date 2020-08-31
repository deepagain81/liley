//
//  FeatureSummaryTypes.swift
//  AllstateUIKit-DemoApp
//
//

import AllstateUIKit
import UIKit

class FeatureSummaryTypes: UIViewController {
    private let navTitle: String = "Feature Summary"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = navTitle
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var navHeaderType: NavigationHeaderType?
        switch segue.identifier {
        case "FeatureSummaryDefault":
            navHeaderType = .featureSummaryDefault
        case "FeatureSummarySegmentedControl":
            navHeaderType = .featureSummarySegmentedControl
        case "FeatureSummarySegmentedControlStatusRow":
            navHeaderType = .featureSummarySegmentedControlStatusRow
        default:
            return
        }
        if let featureSummaryNavigationBar = segue.destination as? FeatureSummaryNavigationBar {
            featureSummaryNavigationBar.type = navHeaderType
        }
    }
}
