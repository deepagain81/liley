//
//  CardMosaicActionView.swift
//  AllstateUIKit

import UIKit

public class CardMosaicActionView: ASThemeableView, XibViewGettable {

    private var cardtype: CardType?
    @IBOutlet private weak var agentImageView: UIImageView!
    @IBOutlet private weak var disclosureImageView: UIImageView!
    @IBOutlet private weak var mainTitle: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var leftCTAButton: ASButton!
    @IBOutlet private weak var rightCTAButton: ASButton!
    @IBOutlet private weak var headerView: UIView!
    private weak  var delegate: CardDelegateProtocol?
    private var contentView: UIView!

    // MARK: Life Cycle Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    override public func onViewDidLoad() {
    }

    // MARK: custom Methods to load and set nib
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

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
              setLabelFonts()
        }
    }
    // MARK: Custom Method to setUPCard
    private func setUPCard() {
        switch cardtype {
        case .mosaicCard:
                addTapGesture()
                mainTitle.textColor = UIColor.primaryDeepBlue
                subTitle.textColor = UIColor.grey5
                agentImageView.setDropShadow()
        case .actionCard:
                mainTitle.textColor = UIColor.grey7
                disclosureImageView.isHidden = true
                subTitle.isHidden = true
        default:
                break
        }
        setDropShadow()
        setLabelFonts()
    }

    // MARK: Custom Method to addGesture for mosaic card headerView
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        headerView.addGestureRecognizer(tap)

        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
                                                               action: #selector(self.handleLongPress(_:)))
        longPressRecognizer.minimumPressDuration = 0.1
        longPressRecognizer.delaysTouchesBegan = true
        headerView.addGestureRecognizer(longPressRecognizer)
    }

    // MARK: Long Press Gesture action for headerview
    @IBAction private func handleLongPress(_ sender: UITapGestureRecognizer? = nil) {
        if sender?.state != UIGestureRecognizer.State.ended {
            //When lognpress is start or running
            headerView.backgroundColor = UIColor.greyShadow
        } else {
            //When lognpress is finish
            delegate?.didPressMosaicHeaderSection()
        }
    }

    // MARK: Tap Gesture action for headerview
    @IBAction private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        headerView.backgroundColor = UIColor.greyShadow
        delegate?.didPressMosaicHeaderSection()
    }

    // MARK: custom method to set label fonts
    private func setLabelFonts() {
        mainTitle.font = ASTheme.font.headline2
        self.mainTitle?.adjustsFontForContentSizeCategory = true
        subTitle.font = ASTheme.font.footnote
        self.subTitle?.adjustsFontForContentSizeCategory = true
    }

    func getMainTitleText() -> String {
        return mainTitle.text ?? ""
    }

    func getSubTitleText() -> String {
        return subTitle.text ?? ""
    }

    func getleftCTAButtonText() -> String {
        return leftCTAButton.titleLabel?.text ?? ""
    }

    func getrightCTAButtonText() -> String {
        return rightCTAButton.titleLabel?.text ?? ""
    }

    func getAgentImage() -> UIImage {
        guard let image = agentImageView.image else {
            return UIImage()
        }
        return image
    }

    /// Method to set card type
    /// - Parameter type: cardType
    func setCardType(type: CardType) {
        cardtype = type
    }

    /// Configure the Card view with provided configuration
    /// - Parameter data: Carddata
    func config(_ data: CardData) {
        //Setup the header section
        if let headerData = data.headerMosaicSection {
            configHeaderSection(headerSectionData: headerData)
        }
        //Setup the call to action section
        if let ctaData = data.callToActionSection {
            configCallToActionSection(callToActionSectionData: ctaData)
        }
    }

    public func resetCardState() {
        headerView.backgroundColor = UIColor.clear
    }

    private func refreshCardsView(cardData: CardData) {
        guard let headerData = cardData.headerMosaicSection
            else { return }
        guard let ctaData = cardData.callToActionSection
            else { return }
        configHeaderSection(headerSectionData: headerData)
        configCallToActionSection(callToActionSectionData: ctaData)
    }

    // MARK: CTA1 Action
    @IBAction private func CTA1Action(_ sender: Any) {
        delegate?.onLeftCTAPress(cardID: "CTA1")
    }

    // MARK: CTA2 Action
    @IBAction private func CTA2Action(_ sender: Any) {
        delegate?.onRightCTAPress(cardID: "CTA2")
    }
}

// MARK: CardView needs to adhere to CardViewProtocol to provide the user facing functions on card view
extension CardMosaicActionView: CardView {
    public func setCardDelegate(as delegate: CardDelegateProtocol) {
        self.delegate = delegate
    }

    /// Method to configure card header section
    /// - Parameter headerSectionData: contains header details
    fileprivate func configHeaderSection(headerSectionData: ContentMosaicActionCardHeaderSection) {
        agentImageView.image = headerSectionData.agentImage
        disclosureImageView.image = headerSectionData.disclosureImage
        mainTitle.text = headerSectionData.title
        subTitle.text = headerSectionData.subtitle
        cardtype = headerSectionData.cardType
        setUPCard()

    }

    /// Method to configure card CTA section
    /// - Parameter CTASectionDta: contains Card CTA section details
    fileprivate func configCallToActionSection(callToActionSectionData: CTASection) {
        leftCTAButton.apply(style: .secondary)
        rightCTAButton.apply(style: .secondary)
        leftCTAButton.setTitle(callToActionSectionData.firstItem?.buttonText, for: .normal)
        rightCTAButton.setTitle(callToActionSectionData.secondItem?.buttonText, for: .normal)
        leftCTAButton.setImage(callToActionSectionData.firstItem?.buttonImage, for: .normal)
        rightCTAButton.setImage(callToActionSectionData.secondItem?.buttonImage, for: .normal)

    }

    public func reloadCard(with data: CardData) {
        refreshCardsView(cardData: data)
    }

    public func updatePriority(with priority: Priority) {
    }
}
