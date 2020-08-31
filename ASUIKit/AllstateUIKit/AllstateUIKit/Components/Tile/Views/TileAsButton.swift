//
//  TileAsButton.swift
//  AllstateUIKit

import Foundation

//number of lines the tile should have
struct Constants {
    static let agentNumberOFLines: Int = 2
    static let idcardNumberOFLines: Int = 3
}

//Font for tile name
struct TileFont {
    static let fontStyle: String = "SFProText-Semibold"
    static let fontSize: CGFloat = 15.0
}

//The Tile View on the ground
public final class TileAsButton: BaseTile, TileButtonProtocol, XibViewGettable {

    @IBInspectable var padding: CGFloat = 16.0
    private var tileType: TileType = .quickAccess
    private var tileData: TileData?
    public var isAccessible: Bool = false
    @IBInspectable var tileStyle: String {
        get {
            return ""
        }
        set {
            switch newValue {
            case "quickAccess":
                tileType = .quickAccess
            case "agent":
                tileType = .agent
            case "idCard":
                tileType = .idCard
            default:
                tileType = .agent
            }
        }
    }
    // MARK: - ------- To load from the nib -------
    var contentWidth: CGFloat = 0
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomFontForTileButton()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomFontForTileButton()
    }
     // MARK: - ------- To adjust button insets according to their types -------
    /// To adjust button size according to its type
    override public var intrinsicContentSize: CGSize {
        let titleSize = calculateTitleLabelSize()
        let imageSize = imageView!.intrinsicContentSize
        var widthValue: CGFloat = 0.0
        var heightValue: CGFloat = 0.0
        if tileType == TileType.quickAccess {
            padding = 10.0
            widthValue = titleSize.width + padding
            heightValue = titleSize.height + imageSize.height + 3*padding
        } else if tileType == TileType.agent {
            let widthInset: CGFloat = 8.0
            widthValue = titleSize.width + padding + widthInset
            heightValue = titleSize.height + 2*padding
        } else if tileType == TileType.idCard {
            widthValue = titleSize.width + padding
            heightValue = titleSize.height + imageSize.height + 3*padding
        }
        return CGSize(width: widthValue, height: heightValue)
    }
    /// To adjust button content insets according to its type
    override public func layoutSubviews() {
        super.layoutSubviews()
        let titleSize = calculateTitleLabelSize()
        let imageSize = imageView!.intrinsicContentSize
        let emptyValue: CGFloat = 0.0
        var titleInset = [CGFloat]()
        var imageInset = [CGFloat]()
        if tileType == TileType.quickAccess {
            padding = 15.0
            titleInset = [imageSize.height + padding, -imageSize.width, emptyValue, emptyValue]
            imageInset = [-titleSize.height, emptyValue, emptyValue, -titleSize.width]
        } else if tileType == TileType.agent {
            let imageTopInset: CGFloat = 6.0
            let imageLeftInset: CGFloat = 10.0
            titleInset = [emptyValue, 2*imageTopInset, emptyValue, emptyValue]
            imageInset = [imageTopInset, imageLeftInset, emptyValue, emptyValue]
        } else if tileType == TileType.idCard {
            titleInset = [imageSize.height + padding, -(imageSize.width - padding), emptyValue, emptyValue]
            imageInset = [-(titleSize.height + padding), padding, emptyValue, emptyValue]
        }
        titleEdgeInsets = UIEdgeInsets(top: titleInset[0], left: titleInset[1],
                                       bottom: titleInset[2], right: titleInset[3])
        imageEdgeInsets = UIEdgeInsets(top: imageInset[0], left: imageInset[1],
                                       bottom: imageInset[2], right: imageInset[3])
    }
    // MARK: - ------- Configure different tile types -------
    /// Populate the content in Quick Access Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    public func configureQuickAccessTile(with tileContent: TileData) {
        tileData = tileContent
        self.tileType = .quickAccess
        setTileLabel()
        setTileImage()
        setCustomFontForTileButton()
    }
    /// Populate the content in Agent Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    public func configureAgentTile(with tileContent: TileData) {
        tileData = tileContent
        self.tileType = .agent
        setCustomFontForTileButton()
        setTileLabel()
        setTileImage()
    }
    /// Populate the content in ID Card Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    public func configureIdCardTile(with tileContent: TileData) {
        tileData = tileContent
        self.tileType = .idCard
        setCustomFontForTileButton()
        setBackgroundForIDCardTile()
        setTileLabel()
        setTileImage()
    }
    // MARK: - ------- Setting up Tile Data -------
    /// To set font style and color
    func setCustomFontForTileButton() {
        if tileType == TileType.quickAccess {
            titleLabel?.textAlignment = .center
            titleLabel?.font = ASTheme.font.caption2Heavy
            titleLabel?.numberOfLines = Constants.agentNumberOFLines
        } else if tileType == TileType.agent {
            contentHorizontalAlignment = .left
            titleLabel?.numberOfLines = Constants.agentNumberOFLines
            if isAccessible {
                titleLabel?.font = ASTheme.font.headlineSemiBold
            } else {
                titleLabel?.font = UIFont(name: TileFont.fontStyle, size: TileFont.fontSize)
            }
        } else {
            contentHorizontalAlignment = .left
            titleLabel?.font = ASTheme.font.headlineSemiBold
            titleLabel?.numberOfLines = Constants.idcardNumberOFLines
        }
        setTitleColor(UIColor.primaryDeepBlue, for: .normal)
        self.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    /// To set Tile Label
    /// - Parameter lineHeight: line height passed from the corresponding tile
    func setTileLabel() {
        if let tileLabel = tileData?.tileMessages.first {
            setTitle(tileLabel, for: .normal)
        }
    }
    /// To set Tile image
    func setTileImage() {
        if let image = tileData?.tileImage {
            setImage(image, for: .normal)
        }
    }
    /// To set background for IDCard Tile
    func setBackgroundForIDCardTile() {
        self.setBackgroundImage(UIImage(named: "idcardBG", in: Bundle(for: TileAsButton.self),
                                        compatibleWith: nil), for: .normal)
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.subviews.first?.contentMode = .center
    }
}
