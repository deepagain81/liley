//
//  SegmentViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class SegmentViewController: UIViewController {
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var messageOutlet: UILabel!
    private var segmentBorderWidth: CGFloat = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        messageOutlet.text = "First Segment Selected"
        messageOutlet.sizeToFit()
        self.navigationController?.setNavigationBarAttributes()
        setUpSegmentAttributes()
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    //Configure segmentControl
    func setUpSegmentAttributes() {
        self.segmentOutlet.setTitleTextAttributes(
                [NSAttributedString.Key.font: ASTheme.font.regular,
                 NSAttributedString.Key.foregroundColor: UIColor.primaryDeepBlue as Any], for: .normal)
        self.segmentOutlet.setTitleTextAttributes(
                [NSAttributedString.Key.font: ASTheme.font.semibold,
                 NSAttributedString.Key.foregroundColor: UIColor.primaryDeepBlue as Any], for: .selected)
        self.segmentOutlet.backgroundColor = UIColor.grey1
        self.segmentOutlet.layer.borderColor = UIColor.grey2?.cgColor
        self.segmentOutlet.layer.borderWidth = segmentBorderWidth
    }

    //Select action for Segmented Control
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            messageOutlet.text = "First Segment Selected"
        } else if sender.selectedSegmentIndex == 1 {
            messageOutlet.text = "Second Segment Selected"
        } else {
            messageOutlet.text = "Third Segment Selected"
        }
        messageOutlet.sizeToFit()
    }

}
