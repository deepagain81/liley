//
//  NavigationViewController.swift
//  AllstateUIKit-DemoApp
//
import AllstateUIKit
import UIKit

class FeatureSummaryNavigationBar: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var contentScrollView: UIScrollView!
    private let navTitle: String = "Large Title/Policy"
    var navigationFeatureSummaryView: NavigationHeaderView!
    var type: NavigationHeaderType?

    override func viewDidLoad() {
        super.viewDidLoad()
        contentScrollView.delegate = self
        self.navigationController?.setNavigationBarAttributes()
        self.navigationItem.title = navTitle
        setupView()
    }

    func setupView() {
        // feature summary label data
        let featureSummaryText = "#098767543121234"
        // segment title data
        let segmentTitles = ["Braking", "High Speeds", "Night Driving"]
        // custom status row header data
        let statusData = StatusHeaderData(with: .header,
                                          statusMessageText: "This vehicle is suspended",
                                          statusHeaderType: .informational)
        // selected segment index
        let selectedSegmentIndex = 1
        switch type {
        //setting up feature summary view
        case .featureSummaryDefault:
            let navigationData = NavigationBarInfo(featureSummary: featureSummaryText)
            navigationFeatureSummaryView = navigationBuilder.create(with: navigationData, type: .featureSummaryDefault)
        //setting up feature summary segmented control view
        case .featureSummarySegmentedControl:
            let navigationData = NavigationBarInfo(segmentTitles: segmentTitles,
                                                   featureSummary: featureSummaryText)
            navigationFeatureSummaryView = navigationBuilder.create(with: navigationData,
                                                                    type: .featureSummarySegmentedControl)
            navigationFeatureSummaryView.setNavigationBarDelegate(as: self)
            // set selected segment control index(add this if needed, else zero by default)
            navigationFeatureSummaryView.setSelectedIndex(selectedSegmentIndex)
        //setting up feature summary segmented control(custom status row) view
        case .featureSummarySegmentedControlStatusRow:
            let navigationData = NavigationBarInfo(segmentTitles: segmentTitles, statusHeaderData: statusData)
            navigationFeatureSummaryView = navigationBuilder.create(with: navigationData,
                                                                    type: .featureSummarySegmentedControlStatusRow)
            navigationFeatureSummaryView.setNavigationBarDelegate(as: self)
        default:
            return
        }
        stackView.addArrangedSubview(navigationFeatureSummaryView)
    }
}

extension FeatureSummaryNavigationBar: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView.superview)
        if velocity.y > 0 {
            // react to dragging down
            navigationFeatureSummaryView.scrollViewWillBeginDragging(upwards: false)
        } else {
            // react to dragging up
            navigationFeatureSummaryView.scrollViewWillBeginDragging(upwards: true)
        }
    }
}

extension FeatureSummaryNavigationBar: NavigationBarDelegate {
    func didSelectSegmentControl(index: Int) {
        let alert = UIAlertController(title: "Alert",
                                      message: "Segment \(index) - Selected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
