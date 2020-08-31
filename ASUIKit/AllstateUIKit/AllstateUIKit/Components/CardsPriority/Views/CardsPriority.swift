//
//  CardsPriority.swift
//  AllstateUIKit

import Foundation
import UIKit

public class CardsPriority: UIView {
    /// comments after the field matches the Zeplin
    /// Cards main view
    @IBOutlet weak var cardsView: UIView!
    @IBOutlet weak var headerSectionTitle1: UILabel! /// sourceSubheadLine
    @IBOutlet weak var headerSectionTitle2: UILabel! /// sourceFootnote
    @IBOutlet weak var headerSectionStackView: UIStackView!
    @IBOutlet weak var headerSectionTitle3Left: UILabel! /// sourceFootnote
    @IBOutlet weak var headerSectionTitle3Right: UILabel! /// sourceFootnote
    @IBOutlet weak var contentSectionTitle1: UILabel! /// lensTitle
    @IBOutlet weak var contentSectionTitle2: UILabel! /// messageFootnote
    @IBOutlet weak var contentSectionTitle3: UILabel! /// $
    /// View(line) added above the bottom section
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var callToActionSectionView: UIView!
    @IBOutlet weak var callToActionSectionCTA1: UIButton! /// SECONDARY CTA
    @IBOutlet weak var callToActionSectionCTA2: UIButton! /// SECONDARY CTA
    @IBOutlet weak var layoutConstraintForDollarWidth: NSLayoutConstraint!
    @IBOutlet weak var constraintForTopSpaceOfContentSecTitle1: NSLayoutConstraint!
    @IBOutlet weak var constraintForTopSpaceOfContentSecTitle2: NSLayoutConstraint!

    public func addTargetToCallToActionSectionCTA1(with selector: Selector, controller: UIViewController) {
        callToActionSectionCTA1.addTarget(controller, action: selector, for: .touchUpInside)
    }

    public func addTargetToCallToActionSectionCTA2(with selector: Selector, controller: UIViewController) {
        callToActionSectionCTA2.addTarget(controller, action: selector, for: .touchUpInside)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public convenience init?(frame: CGRect, cardType: String) {
        self.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public var showShimmerAnimation: Bool? {
        didSet {
            if showShimmerAnimation == true {
                self.addGradientColorForlazyLoad()
                self.startAnimation()
            } else {
                self.stopAnimation { (_) in }
            }
        }
    }

    /// This function set's the Card View
    private func setupView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CardsPriority", bundle: bundle)
        cardsView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        addShadow()
        cardsView.frame = self.bounds
        cardsView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        cardsView.layer.masksToBounds = false
        addSubview(cardsView)
        callToActionSectionCTA1.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        callToActionSectionCTA2.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        callToActionSectionCTA2.isHidden = true
    }
    // MARK: - Remove Gradient Layer from the Card
    func removeGradientLayer() {
        removeGradientFromLabels()
        ///Remove Gradient from bottomSectionView
        for gradientView in callToActionSectionView.layer.sublayers!  where gradientView is CAGradientLayer {
                gradientView.removeFromSuperlayer()
        }
        for gradientView in self.subviews where gradientView is UILabel {
                gradientView.backgroundColor = UIColor.clear
        }
    }

    /// Removing Gradient Layer from Labels
    func removeGradientFromLabels() {
        headerSectionTitle1.layer.sublayers?.removeAll()
        headerSectionTitle2.layer.sublayers?.removeAll()
        headerSectionTitle3Left.layer.sublayers?.removeAll()
        headerSectionTitle3Right.layer.sublayers?.removeAll()
        contentSectionTitle1.layer.sublayers?.removeAll()
        contentSectionTitle2.layer.sublayers?.removeAll()
        contentSectionTitle3.layer.sublayers?.removeAll()
    }

    // MARK: - Add Gradient layer on the Card during Animation
    func addGradientColorForlazyLoad() {
        for gradientStack in self.subviews {
            for gradientStack2 in gradientStack.subviews {
                if gradientStack2 is UIStackView {
                    for stack in gradientStack2.subviews where stack is UILabel {
                            stack.addGradient(color1: UIColor.grey1!, color2: UIColor.grey3!)
                    }
                }
                if gradientStack2 is UILabel {
                    gradientStack2.addGradient(color1: UIColor.grey1!, color2: UIColor.grey3!)
                }
            }
        }
        callToActionSectionView.addGradient(color1: UIColor.grey1!, color2: UIColor.grey3!)
        updateLabelsAndConstraints()
    }

    /// Updating labels, buttons and constraints for Lazyload
    func updateLabelsAndConstraints() {
        headerSectionTitle1.text = " "
        headerSectionTitle2.text = " "
        headerSectionTitle3Left.text = " "
        headerSectionTitle3Right.text = " "
        contentSectionTitle1.text = " "
        contentSectionTitle2.text = " "
        contentSectionTitle3.text = " "
        layoutConstraintForDollarWidth.constant = 0.0
        headerSectionStackView.isHidden = true
        contentSectionTitle3.isHidden = true
        callToActionSectionCTA1.isHidden = true
        callToActionSectionCTA2.isHidden = true
    }

    // MARK: - Design of Seven different types of Card
    /// - Parameters:
    ///   - data: Model class is called to add values to the Label/Buttons from the service
    ///   - cardtype: Select the required type of card
    public func prepareCardUI(data: CardsPriorityData) {
        removeGradientLayer()
        callToActionSectionCTA1.isHidden = false
        headerSectionTitle1.text = data.headerSection?.titleLine1
        headerSectionTitle2.text = data.headerSection?.titleLine2
        contentSectionTitle1.text = data.contentSection?.titleLine1
        callToActionSectionCTA1.setImage(data.callToActionSection?.firstItem?.image, for: .normal)
        callToActionSectionCTA1.setTitle(data.callToActionSection?.firstItem?.text, for: .normal)
        callToActionSectionCTA2.setImage(data.callToActionSection?.secondItem?.image, for: .normal)
        callToActionSectionCTA2.setTitle(data.callToActionSection?.secondItem?.text, for: .normal)
    }
}

extension CardsPriority {
    func contentMessageCard(data: CardsPriorityData) {
        headerSectionStackView.isHidden = true
        ///Todo: we should change the font to SFProDisplay-Bold with size 22 once available
        contentSectionTitle1.font = UIFont.boldSystemFont(ofSize: 22)
        contentSectionTitle1.font = ASTheme.font.titleBold
        contentSectionTitle1.textColor = UIColor.grey7
        contentSectionTitle2.text = data.contentSection?.titleLine2
        contentSectionTitle2.font = ASTheme.font.regular
        //Todo: we should change the font to SFProText-Regular with size 13 once available
        contentSectionTitle2.font = UIFont.systemFont(ofSize: 13)
        contentSectionTitle2.textColor = UIColor.grey5
        contentSectionTitle3.isHidden = true
        callToActionSectionCTA1.setTitleColor(UIColor.primaryDeepBlue, for: .normal)
        callToActionSectionCTA1.backgroundColor = ASTheme.color.background
        callToActionSectionCTA2.isHidden = true
        layoutConstraintForDollarWidth.constant = 1
        constraintForTopSpaceOfContentSecTitle1.constant = 15.5
        constraintForTopSpaceOfContentSecTitle2.constant = 8.0
    }

    func contentMessageMultiCTACard(data: CardsPriorityData) {
        callToActionSectionCTA2.isHidden = false
        callToActionSectionCTA2.setTitleColor(UIColor.primaryDeepBlue, for: .normal)
        callToActionSectionCTA2.setTitle(data.callToActionSection?.secondItem?.text, for: .normal)
    }

    func contentMessageMultiSourceCard(data: CardsPriorityData) {
        headerSectionStackView.isHidden = false
        headerSectionTitle3Left.text = data.headerSection?.titleLine3Left
        headerSectionTitle3Right.text = data.headerSection?.titleLine3Right
        contentSectionTitle2.text = ""
        constraintForTopSpaceOfContentSecTitle2.constant = 0.0
    }

    func contentMessageMultiSourcePriorityCard(data: CardsPriorityData) {
        contentSectionTitle1.font = ASTheme.font.largeTitle
        contentSectionTitle1.textColor = UIColor.primaryDeepBlue
        contentSectionTitle2.textColor = UIColor.primaryDeepBlue
        contentSectionTitle2.text = data.contentSection?.titleLine2
        contentSectionTitle2.font = ASTheme.font.headline2
        lineView.isHidden = true
        callToActionSectionCTA1.backgroundColor = UIColor.secondaryYellow
        constraintForTopSpaceOfContentSecTitle2.constant = 16.0
    }

    func contentMessageMultiSourceHighPriorityCard(data: CardsPriorityData) {
        contentSectionTitle1.textColor = UIColor.secondaryRed
        contentSectionTitle2.textColor = UIColor.secondaryRed
        callToActionSectionCTA1.backgroundColor = UIColor.secondaryRed
        callToActionSectionCTA1.setTitleColor(ASTheme.color.background, for: .normal)
    }

    func contentAmountPriorityCard(data: CardsPriorityData) {
        contentSectionTitle1.font = ASTheme.font.largeTitle
        contentSectionTitle1.textColor = UIColor.primaryDeepBlue
        contentSectionTitle2.font = ASTheme.font.headline2
        contentSectionTitle2.textColor = UIColor.primaryDeepBlue
        contentSectionTitle3.isHidden = false
        contentSectionTitle3.textColor = UIColor.primaryDeepBlue
        contentSectionTitle3.text = "$"
        lineView.isHidden = true
        callToActionSectionCTA1.backgroundColor = UIColor.secondaryYellow
        layoutConstraintForDollarWidth.constant = 15.0
        constraintForTopSpaceOfContentSecTitle1.constant = 23.5
        constraintForTopSpaceOfContentSecTitle2.constant = 16.0
    }

    func contentAmountHighPriorityCard(data: CardsPriorityData) {
        contentSectionTitle1.textColor = UIColor.secondaryRed
        contentSectionTitle2.textColor = UIColor.secondaryRed
        contentSectionTitle3.textColor = UIColor.secondaryRed
        callToActionSectionCTA1.backgroundColor = UIColor.secondaryRed
        callToActionSectionCTA1.setTitleColor(ASTheme.color.background, for: .normal)
    }

}
