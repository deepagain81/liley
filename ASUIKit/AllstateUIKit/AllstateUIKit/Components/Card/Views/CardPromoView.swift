//
//  CardView.swift
//  ASUIKit

import Foundation

public class CardPromoView: ASThemeableView, XibViewGettable {

    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var primaryButton: ASButton!
    @IBOutlet private weak var fpButton: UIButton!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var priorityView: UIView!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var baseStackView: UIStackView!
    @IBOutlet private weak var fpoLabel: UILabel!
    private var CTA1ActionCompletion: OnCardLeftButtonTap?
    private var CTA2ActionCompletion: OnCardRightButtonTap?
    private weak var delegate: CardDelegateProtocol?
    private var cardtype: CardType?
    private var contentView: UIView!

    override public func onViewDidLoad() {
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
        setUpPromoView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
        setUpPromoView()
    }
    private func nibSetup() {
        guard let nibview = loadViewFromNib()
            else { return }
        nibview.frame = self.bounds
        self.addSubview(nibview)
        contentView = nibview
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            primaryButton.titleLabel?.font = ASTheme.font.rowLabelFont
            self.gradientView.layer.sublayers?[0].removeFromSuperlayer()
            setUpPromoView()
        }
    }
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    private func setUpPromoView() {
        self.priorityView.setDropShadow()
        DispatchQueue.main.async {
            self.gradientView.setGradientBackground()
        }
        fpoLabel.font = ASTheme.font.headline
        self.fpoLabel?.adjustsFontForContentSizeCategory = true
        headlineLabel.font = ASTheme.font.headline
        self.headlineLabel?.adjustsFontForContentSizeCategory = true
        captionLabel.font = ASTheme.font.captionMedium
        self.captionLabel?.adjustsFontForContentSizeCategory = true
        primaryButton.apply(style: .primary)
        primaryButton.titleLabel?.font = ASTheme.font.rowLabelFont
        primaryButton.titleLabel?.numberOfLines = 0
    }
    func getHeadLineLabelText() -> String {
        return headlineLabel.text ?? ""
    }
    func getCaptionLabelText() -> String {
        return captionLabel.text ?? ""
    }
    func getBackgroundImage() -> UIImage {
        guard let image = backgroundImageView.image else {
            return UIImage()
        }
        return image
    }
    func getCallToActionButtonText() -> String {
        return primaryButton.titleLabel?.text ?? ""
    }
    /// Method to set card type
    /// - Parameter type: cardType
    func setCardType(type: CardType) {
        cardtype = type
    }
    /// Configure the Card view with provided configuration
    /// - Parameter data: Carddata
    func config(_ data: CardData) {
        if let promoData = data.promoCard {
            self.configPromoSection(promoSectionData: promoData)
        }
        if let promoBackgroundData = data.promoBackground {
            self.configPromoBackgroundSection(promoBackgroundSectionData: promoBackgroundData)
        }
    }

    @IBAction private func primaryAction1(_ sender: Any) {
        delegate?.onLeftCTAPress(cardID: "PrimaryCTA")
        if let completionBlock = CTA1ActionCompletion {
            completionBlock("PrimaryCTA")
        }
    }
    private func refreshCardView(cardData: CardData) {
        guard let promoCardData = cardData.promoCard
            else { return }
        guard let promoBackgroundData = cardData.promoBackground
            else { return }
        configPromoSection(promoSectionData: promoCardData)
        configPromoBackgroundSection(promoBackgroundSectionData: promoBackgroundData)
    }
    @IBAction private func ctaAction1(_ sender: Any) {
        delegate?.onLeftCTAPress(cardID: "CTA1")
        if let completionBlock = CTA1ActionCompletion {
            completionBlock("CTA1")
        }
    }

    @IBAction private func ctaAction2(_ sender: Any) {
        delegate?.onRightCTAPress(cardID: "CTA2")
        if let completionBlock = CTA2ActionCompletion {
            completionBlock("CTA1")
        }
    }
}
///CardView needs to adhere to CardViewProtocol to provide the user facing functions on card view
extension CardPromoView: CardView {
    public func setCardDelegate(as delegate: CardDelegateProtocol) {
        self.delegate = delegate
    }
    public func updatePriority(with priority: Priority) {
    }
    public func reloadCard(with data: CardData) {
        refreshCardView(cardData: data)
    }
    ///Sets the action callback for CTA item1 in CTA group
    func setCTA1ActionCallback(_ action: @escaping OnCardLeftButtonTap) {
    }
    ///Sets the action callback for CTA item2 in CTA group
    func setCTA2ActionCallback(_ action: @escaping OnCardRightButtonTap) {
    }

}
///Private functions
extension CardPromoView {

    /// Method to configure promo section
    /// - Parameter promoSectionData: promoSectionData
    fileprivate func configPromoSection(promoSectionData: PromoCardHeaderSection) {
        self.fpoLabel.text = promoSectionData.fpoText
        self.headlineLabel.text = promoSectionData.headlineText
        self.captionLabel.text = promoSectionData.captionText
        self.fpButton.setBackgroundImage(promoSectionData.logoImage, for: UIControl.State.normal)

    }

    /// Method to configure promo background section
    /// - Parameter promoBackgroundSectionData: promoBackgroundSectionData
    fileprivate func configPromoBackgroundSection(promoBackgroundSectionData: PromoCardCallToActionSection) {
        self.backgroundImageView.image = promoBackgroundSectionData.backgroundImage
        self.primaryButton.setTitle(promoBackgroundSectionData.primaryButtonTitle, for: UIControl.State.normal)
    }
}
