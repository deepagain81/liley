//
//  NavigationBarView.swift
//  ASUIKit
//
//

import UIKit

final public class NavigationBarView: NavigationHeaderBaseView {
    @IBOutlet private weak var bottomStackView: UIStackView!
    @IBOutlet private weak var topSeperatorLineView: UIView!
    @IBOutlet private weak var topSeperatorLine: UIView!
    @IBOutlet private weak var featureSummaryView: UIView!
    @IBOutlet private weak var featureSummaryLabel: UILabel!
    @IBOutlet private weak var bottomStackHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var statusHeaderView: StatusHeaderView?
    @IBOutlet private weak var segmentControlView: UIView!
    @IBOutlet private weak var segmentControlSeperatorLine: UIView!
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    private var contentView: UIView!
    // MARK: - Local variables
    private var navigationType: NavigationHeaderType = .featureSummaryDefault
    private var navigationData: NavigationBarInfo?
    private weak var delegate: NavigationBarDelegate?
    // MARK: - Constants
    private let nibName = "NavigationBarView"
    private struct Constant {
        static let animateDuration: TimeInterval = 0.5
        static let defaultSelectedSegment: Int = 0
        static let segmentLabelFont: String = "SFProText-Semibold"
        static let segmentLabelFontSize: CGFloat = 14.0
        static let alphaZero: CGFloat = 0.0
        static let alphaOne: CGFloat = 1.0
    }
    /// Getters for UI items - accessed from test cases
    var getSegmentControl: UISegmentedControl {
        return segmentControl
    }
    var getStatusHeaderiew: StatusHeaderView? {
        return statusHeaderView
    }
    var getFeatureSummarylbl: UILabel {
        return featureSummaryLabel
    }
    // MARK: - ------- To load from the nib -------
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        initView()
    }

    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        initView()
    }

    /// To initialize the nib and constraints for the view
    private func initView() {
        backgroundColor = .clear
        if let nibView = loadViewFromNib() {
            contentView = nibView
            contentView.frame = bounds
            contentView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contentView)
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        setUpView()
    }

    /// function to load a nib.
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    /// Setting up appearance for view
    private func setUpView() {
        self.backgroundColor = .white
        self.layoutIfNeeded()
        setupAppearance()
        self.setDropShadow()
    }

    // MARK: - ------- Configure Navigation Bar -------
    /// Configure appearance for custom Navigation bar
    private func setupAppearance() {
        self.featureSummaryLabel.font = ASTheme.font.body
        self.featureSummaryLabel.textColor = UIColor.grey5
        // Implementing fixed font for Segment Control label to opt out from Accessibilty
        self.segmentControl.setTitleTextAttributes([
            .foregroundColor: UIColor.primaryDeepBlue as Any,
            NSAttributedString.Key.font: UIFont(name: Constant.segmentLabelFont,
                                                size: Constant.segmentLabelFontSize) as Any], for: .normal)
    }

    /// Configure the Navigation bar to different types
    func configureFeatureSummaryHeader(with navigationBarContent: NavigationBarInfo, type: NavigationHeaderType) {
        self.navigationData = navigationBarContent
        self.navigationType = type
        switch navigationType {
        case .featureSummaryDefault:
            setupFeatureSummaryDefaultHeader()
        case .featureSummarySegmentedControl:
            setupFeatureSummarySegmentControlHeader()
        case .featureSummarySegmentedControlStatusRow:
            setupFeatureSummarySegmentedStatusRowHeader()
        default:
            setupFeatureSummaryDefaultHeader()
        }
    }

    /// setup Feature Summary default Navigation bar
    private func setupFeatureSummaryDefaultHeader() {
        featureSummaryLabel.text = self.navigationData?.featureSummary
        setupSegmentControlView(isHidden: true)
    }

    /// setup Feature Summary Segmented Control Navigation bar
    private func setupFeatureSummarySegmentControlHeader() {
        segmentControl.setupSegments(segments: self.navigationData?.segmentTitles ?? [],
                                     selectedSegmentIndex: Constant.defaultSelectedSegment)
        featureSummaryLabel.text = self.navigationData?.featureSummary
        statusHeaderView?.isHidden = true
    }

    /// setup Feature Summary Segmented Control Navigation bar with Custom Row
    private func setupFeatureSummarySegmentedStatusRowHeader() {
        segmentControl.setupSegments(segments: self.navigationData?.segmentTitles ?? [],
                                     selectedSegmentIndex: Constant.defaultSelectedSegment)
        if let statusHeaderData = self.navigationData?.statusHeaderData {
            statusHeaderView?.reloadStatusView(with: statusHeaderData)
        }
        setupFeatureSummaryView(isHidden: true)
        segmentControlSeperatorLine.isHidden = true
    }

    /// show/hide Feature Summary Segmented Control Navigation bar
    private func setupSegmentControlView(isHidden: Bool) {
        segmentControlSeperatorLine.isHidden = isHidden
        segmentControl.isHidden = isHidden
        segmentControlView.isHidden = isHidden
        statusHeaderView?.isHidden = isHidden
    }

    /// show/hide Feature Summary Default Navigation bar
    private func setupFeatureSummaryView(isHidden: Bool) {
        topSeperatorLine.isHidden = isHidden
        topSeperatorLineView.isHidden = isHidden
        featureSummaryLabel.isHidden = isHidden
        featureSummaryView.isHidden = isHidden
    }

    /// this function defines view behaviours on scrolling
    public override func scrollViewWillBeginDragging(upwards: Bool) {
        if navigationType == .featureSummarySegmentedControlStatusRow {
            if let statusHeaderView = statusHeaderView {
                animateView(statusHeaderView, hidden: upwards)
            }
        } else {
            animateView(featureSummaryView, hidden: upwards)
            topSeperatorLine.isHidden = upwards
            topSeperatorLineView.isHidden = upwards
            if self.navigationType == .featureSummarySegmentedControl {
                self.segmentControlSeperatorLine.isHidden = upwards
            }
        }
        self.layoutIfNeeded()
    }

    /// this function animates views with opacity
    private func animateView(_ view: UIView, hidden: Bool) {
        var alpha: CGFloat = Constant.alphaZero
        if !hidden {
            alpha = Constant.alphaOne
        }
        UIView.transition(with: view, duration: Constant.animateDuration, options: .curveLinear, animations: {
            for subView in view.subviews {
                subView.alpha = alpha
            }
            view.isHidden = hidden
        })
    }

    /// Selcected Segment Action
    @IBAction func didSelectSegment(_ sender: UISegmentedControl) {
        delegate?.didSelectSegmentControl(index: sender.selectedSegmentIndex)
    }

    /// This is delegate method RowDelegate .
    public override func setNavigationBarDelegate(as delegate: NavigationBarDelegate) {
        self.delegate = delegate
    }

    /// This method used for setting index of segmented control manually.
    public override func setSelectedIndex(_ currentIndex: Int) {
        segmentControl.selectedSegmentIndex = currentIndex
    }
}

extension UISegmentedControl {
    // Configure Segment Control
    func setupSegments(segments: [String], selectedSegmentIndex: Int) {
        self.removeAllSegments()
        for segment in segments {
            self.insertSegment(withTitle: segment, at: self.numberOfSegments, animated: false)
        }
        self.selectedSegmentIndex = selectedSegmentIndex
    }
}
