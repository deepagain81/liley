//
//  ViewController.swift
//  TypographyDemo
//

import UIKit
import AllstateUIKit

class TypographyViewController: UIViewController {
    @IBOutlet weak var largeTitleLbl: UILabel!
    @IBOutlet weak var title1Lbl: UILabel!
    @IBOutlet weak var title2Lbl: UILabel!
    @IBOutlet weak var title3Lbl: UILabel!
    @IBOutlet weak var headlineLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var calloutLbl: UILabel!
    @IBOutlet weak var subheadLbl: UILabel!
    @IBOutlet weak var footnoteLbl: UILabel!
    @IBOutlet weak var caption1Lbl: UILabel!
    @IBOutlet weak var caption2Lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setProp()
        setUpLabel()
    }
    func setProp() {
        largeTitleLbl.adjustsFontForContentSizeCategory = true
        title1Lbl.adjustsFontForContentSizeCategory = true
        title2Lbl.adjustsFontForContentSizeCategory = true
        title3Lbl.adjustsFontForContentSizeCategory = true
        headlineLbl.adjustsFontForContentSizeCategory = true
        bodyLbl.adjustsFontForContentSizeCategory = true
        calloutLbl.adjustsFontForContentSizeCategory = true
        subheadLbl.adjustsFontForContentSizeCategory = true
        footnoteLbl.adjustsFontForContentSizeCategory = true
        caption1Lbl.adjustsFontForContentSizeCategory = true
        caption2Lbl.adjustsFontForContentSizeCategory = true
    }
    func setUpLabel() {
        largeTitleLbl.font = ASTheme.font.largeTitle
        title1Lbl.font = ASTheme.font.title1
        title2Lbl.font = ASTheme.font.title2
        title3Lbl.font = ASTheme.font.title3
        headlineLbl.font = ASTheme.font.headline
        bodyLbl.font = ASTheme.font.body
        calloutLbl.font = ASTheme.font.callout
        subheadLbl.font = ASTheme.font.subhead
        footnoteLbl.font = ASTheme.font.footnote
        caption1Lbl.font = ASTheme.font.caption1
        caption2Lbl.font = ASTheme.font.caption2
    }
}
