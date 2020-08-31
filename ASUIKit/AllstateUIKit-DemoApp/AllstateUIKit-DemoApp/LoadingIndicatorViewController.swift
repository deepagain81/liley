//
//  LoadingIndicatorViewController.swift
//  AllstateUIKit-DemoApp
//

import AllstateUIKit
import UIKit

class LoadingIndicatorViewController: UIViewController {

    @IBOutlet weak var loaderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /// Start loadingIndicator method
    @IBAction func showLoadingIndicatorAction(_ sender: Any) {
        loaderView.startAnimatingLoadingIndicator()
        /// Below code is for hiding navigation bar, if consumer wants to hide navigation bar while showing loading
        /// indicator they can hide like below and can show navigation bar when stopping loading indicator
        /// NOTE: Hiding/Showing navigation bar is optional
        self.navigationController?.navigationBar.isHidden = true
        /// NOTE: for passing custom message on LoadingIndicator call below method on view
        /// loaderView.startAnimatingLoadingIndicator(loaderMessage: "Custom message")
    }

    /// Stop loadingIndicator method
    @IBAction func hideLoadingIndicatorAction(_ sender: Any) {
        loaderView.stopAnimatingLoadingIndicator()
        /// If consumer hide navigation bar while showing loading indicator then
        /// show navigation bar like below
        /// NOTE: Hiding/Showing navigation bar is optional
        self.navigationController?.navigationBar.isHidden = false
    }
}

// MARK: StoryboardIdentifierProtocol
extension LoadingIndicatorViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "LoadingIndicatorViewController"
    }
}
