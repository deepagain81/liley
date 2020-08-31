//
//  ViewController.swift
//  Colors
//

import UIKit
import AllstateUIKit

class ColorViewController: UIViewController {
    @IBOutlet weak var primaryBlueView: UIView!
    @IBOutlet weak var primaryDeepBlueView: UIView!
    @IBOutlet weak var secondaryAltBlueView: UIView!
    @IBOutlet weak var secondaryYellowView: UIView!
    @IBOutlet weak var secondaryOrangeView: UIView!
    @IBOutlet weak var secondaryPinkView: UIView!
    @IBOutlet weak var secondaryGreenView: UIView!
    @IBOutlet weak var secondaryRedView: UIView!
    @IBOutlet weak var tintsOrangeTintView: UIView!
    @IBOutlet weak var tintsPinkView: UIView!
    @IBOutlet weak var tintsGreenView: UIView!
    @IBOutlet weak var tintsBlueView: UIView!
    @IBOutlet weak var tintsGreyShadowView: UIView!
    @IBOutlet weak var tintsGroundFloorView: UIView!
    @IBOutlet weak var greysGrey1View: UIView!
    @IBOutlet weak var greysGrey2View: UIView!
    @IBOutlet weak var greysGrey3View: UIView!
    @IBOutlet weak var greysGrey4View: UIView!
    @IBOutlet weak var greysGrey5View: UIView!
    @IBOutlet weak var greysGrey6View: UIView!
    @IBOutlet weak var greysGrey7View: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPrimaryColorView()
        loadSecondaryColorView()
    }

    func loadPrimaryColorView() {
        primaryBlueView.backgroundColor = UIColor.primaryBlue
        primaryDeepBlueView.backgroundColor = UIColor.primaryDeepBlue
    }

    func loadSecondaryColorView() {
        secondaryAltBlueView.backgroundColor = UIColor.secondaryAltBlue
        secondaryYellowView.backgroundColor = UIColor.secondaryYellow
        secondaryOrangeView.backgroundColor = UIColor.secondaryOrange
        secondaryPinkView.backgroundColor = UIColor.secondaryPink
        secondaryGreenView.backgroundColor = UIColor.secondaryGreen
        secondaryRedView.backgroundColor = UIColor.secondaryRed
    }

}
