//
//  ASButtonViewController.swift
//  OneApp
//

import UIKit
import AllstateUIKit

class ASButtonViewController: UIViewController {
    @IBOutlet weak var demoStackView: UIStackView!
    @IBOutlet weak var primaryButton: ASButton!
    @IBOutlet weak var priorityButton: ASButton!
    @IBOutlet weak var highPriorityButtton: ASButton!
    @IBOutlet weak var secondaryButton: ASButton!
    @IBOutlet weak var secondaryDoubleLeftButton: ASButton!
    @IBOutlet weak var secondaryDoubleRightButton: ASButton!
    @IBOutlet weak var tertiaryButton: ASButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //add value for padding the text
        self.setUpButtonType()
        self.createDisabledButton()
    }

    /// Create Disabled Button Programmatically
    fileprivate func createDisabledButton() {
        //Programmatically creating button
        let disabledPrimaryButton = ASButton()
        disabledPrimaryButton.setTitle("DISABLED PRIMARY", for: .normal)
        disabledPrimaryButton.setImage(UIImage(named: "disabledButtonImage"), for: .normal)
        disabledPrimaryButton.apply(style: .primary)
        disabledPrimaryButton.isEnabled = false
        self.demoStackView.addArrangedSubview(disabledPrimaryButton)
    }

    /// Setting Button type by passing buttonstyle obj as param
    fileprivate func setUpButtonType() {
        primaryButton.apply(style: .primary)
        priorityButton.apply(style: .priority)
        highPriorityButtton.apply(style: .highPriority)
        secondaryButton.apply(style: .secondary)
        secondaryDoubleLeftButton.apply(style: .secondaryDouble)
        secondaryDoubleRightButton.apply(style: .secondaryDouble)
        tertiaryButton.apply(style: .tertiary)
    }
}
