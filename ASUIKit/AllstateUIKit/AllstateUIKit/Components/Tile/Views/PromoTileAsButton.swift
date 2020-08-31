//
//  TileViewAsButton.swift
//  AllstateUIKit

import Foundation

public class PromoTileAsButton: UIButton, XibViewGettable, TileButtonProtocol {
  private weak var tileDelegate: TileDelegate?
  private var tileType: TileType = .quickAccess
  private var tileData: TileData?
  @IBOutlet weak var imageTitleLabel: UILabel!
  @IBOutlet weak var headingLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var backgroundImage: UIImageView!
  @IBOutlet weak var maskImage: UIImageView!
  var view: UIView!
    /// To populate content in Promo Tile
    /// - Parameter tileContent: Dynamic data from model ASTileData
    public func configurePromoTile(with tileContent: TileData) {
        tileData = tileContent
        self.tileType = .promo
        backgroundImage.image = tileData?.tileImage
        setupPromoContent()
        setupCustomFontForButton()
        setupHighlightedState()
    }
    /// To Highlight only the image when whole tile is clicked
    func setupHighlightedState() {
        self.addTarget(self, action: #selector(buttonHighlighted), for: .touchDown)
        self.addTarget(self, action: #selector(promoTileClickAction), for: .touchUpInside)
    }
    @IBAction func promoTileClickAction() {
        maskImage.isHidden = true
    }
    @IBAction func buttonHighlighted() {
        maskImage.isHidden = false
    }
    // MARK: - ------- Interface functions -------
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    private func nibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    /// To load nib
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return nibView!
    }
    /// To call promo tile from storyboard
    /// - Parameters:
    ///   - data: Dynamic data from model ASTileData
    ///   - buttonFrame: buttonFrame: Frame of the Button
    public func reloadTile(with data: TileData) {
        configurePromoTile(with: data)
    }
    // MARK: - ------- Setting up promo tile data -------
    /// Populating label values in respective labels
    fileprivate func setupPromoContent() {
        guard let data = tileData else {
            return
        }
        let labelCount = data.tileMessages.count
        if labelCount > 0 {
            imageTitleLabel.text = data.tileMessages[0]
        }
        if labelCount > 1 {
            headingLabel.text = data.tileMessages[1]
        }
        if labelCount > 2 {
            messageLabel.text = data.tileMessages[2]
        }
    }
    /// To set Tile Label font style and color
    func setupCustomFontForButton() {
        imageTitleLabel.font = ASTheme.font.largeTitle
        imageTitleLabel.textColor = UIColor.secondaryPink
        imageTitleLabel.adjustsFontForContentSizeCategory = true
        headingLabel.font = ASTheme.font.headlineSemiBold
        headingLabel.textColor = UIColor.grey7
        headingLabel.adjustsFontForContentSizeCategory = true
        messageLabel.font = ASTheme.font.footnote
        messageLabel.textColor = UIColor.grey5
        messageLabel.adjustsFontForContentSizeCategory = true
    }
}
