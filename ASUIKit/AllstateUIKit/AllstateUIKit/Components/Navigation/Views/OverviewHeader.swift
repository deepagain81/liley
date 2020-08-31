//
//  OverviewHeader.swift
//  AllstateUIKit

import UIKit

public class OverviewHeader: NavigationHeaderBaseView {
    @IBOutlet private weak var bottomStackView: UIStackView!
    @IBOutlet private weak var firstLargeTile: TileAsButton!
    @IBOutlet private weak var secondLargeTile: TileAsButton!
    @IBOutlet private weak var thirdLargeTile: TileAsButton!
    @IBOutlet private weak var topStackView: UIStackView!
    @IBOutlet private weak var firstSmallTile: UIButton!
    @IBOutlet private weak var secondSmallTile: UIButton!
    @IBOutlet private weak var thirdSmallTile: UIButton!
    @IBOutlet private weak var bottomStackConstraint: NSLayoutConstraint!
    private var largeTileBadge: Badge?
    private var smallTileBadge: Badge?
    // MARK: - Local constants
    private enum TileId {
        static let first: String = "1"
        static let second: String = "2"
        static let third: String = "3"
    }

    // Constants for small tiles text setup
    private enum CharaterConstants {
        static let newLine: String = "\n"
        static let space: String = " "
    }

    //Font for tile name
    private struct TileFont {
        static let name: String = "SFProText-Heavy"
        static let size: CGFloat = 11.0
    }

    private var contentView: UIView!
    private let nibName = "OverviewHeaderTiles"
    public weak var tileDelegate: TileDelegate?
    private var navigationData: NavigationBarInfo?
    // MARK: - ------- To load from the nib -------
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        initView()
    }

    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        initView()
    }

    // To initialize the nib and constraints for the view
    private func initView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    // function to load a nib.
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    //Add shadow to the view only on the bottom of the frame
    public override func layoutSubviews() {
        self.dropShadow(top: false, left: false, bottom: true, right: false)
    }

    //Update here if needs to apply the current theme on the row being contructred.
    override public func onViewDidLoad() {
    }
    // MARK: - ------- Interface functions -------
    override public func setTileDelegate(as delegate: TileDelegate) {
         tileDelegate = delegate
    }

    // MARK: - ------- Configure Tiles -------
    //Configure the Navigation bar Policy Label with default values
    func configureOverviewHeader(with navigationBarContent: NavigationBarInfo, type: NavigationHeaderType) {
        configureQuickAcessHeader(with: navigationBarContent, navigationType: .quickAccess)
        contentView.backgroundColor = ASTheme.color.background
    }

    //Configure the Navigation bar with Quick Access Tile
    func configureQuickAcessHeader(with navigationBarContent: NavigationBarInfo, navigationType: NavigationHeaderType) {
        //Creation of Quick Access tile
        if let quickAccesstileData = navigationBarContent.leftTile {
            createQuickAccessTile(tile: quickAccesstileData, largeButton: firstLargeTile,
            smallButton: firstSmallTile, tileAction: .tile1ClickAction)
        }
        if let quickAccesstileData = navigationBarContent.middleTile {
            createQuickAccessTile(tile: quickAccesstileData, largeButton: secondLargeTile,
            smallButton: secondSmallTile, tileAction: .tile2ClickAction)
        }
        if let quickAccesstileData = navigationBarContent.rightTile {
            createQuickAccessTile(tile: quickAccesstileData, largeButton: thirdLargeTile,
            smallButton: thirdSmallTile, tileAction: .tile3ClickAction)
        }
    }
     //Configure of Quick Access tile
       func createQuickAccessTile(tile: TileData,
                                  largeButton: TileAsButton,
                                  smallButton: UIButton,
                                  tileAction: Selector) {
           //Preparing data for tile
           largeButton.configureQuickAccessTile(with: tile)
           largeButton.titleLabel?.font = UIFont(name: TileFont.name, size: TileFont.size)
           largeButton.addTarget(self, action: tileAction, for: .touchUpInside)
           largeButton.alpha = 1
           setUpSmallTile(smallButton: smallButton, title: tile.tileMessages as? [String] ?? [""])
       }

    ///The difference in navigation bar height between the large titles and default is used to interpolate
    /// the height difference of tile reusable components
    public override func calculateInitialViewConstraints(navigationController: UINavigationController) -> CGFloat {
        calculateNavBarDifference(navigationController: navigationController)
        calculateStackViewHeightDifference(from: topStackView,
                                           to: bottomStackView,
                                           heightConstraint: bottomStackConstraint.constant )
        return bottomStackConstraint.constant
    }

    ///The top stack represents the UI elements present in collapsed state and the bottom stack represents
    ///the UI elements in expanded state. The difference is initially calculated for interpolation.
    /// Returns CGFloat value for Scroll Height constraints
    public override func calculateScrollHeightConstraints(navigationController: UINavigationController) -> CGFloat {
        HeightConstants.navOffset = ((navigationController.navigationBar.frame.height -
            HeightConstants.finalNavBarHeight) / HeightConstants.differenceNavBarHeight)
        if HeightConstants.navOffset < HeightConstants.tileSwitchAlpha {
            topStackView.alpha = 1
        } else {
            topStackView.alpha = 0
        }
        let translateOffset = -((1-HeightConstants.navOffset)*HeightConstants.differenceStackViewHeight)
        bottomStackView.alpha = HeightConstants.navOffset
        return (HeightConstants.largeStackViewHeight + (translateOffset))
    }

    @objc func tile1ClickAction() {
        tileDelegate?.onTilePress(tileID: TileId.first)
    }

    @objc func tile2ClickAction() {
        tileDelegate?.onTilePress(tileID: TileId.second)
    }

    @objc func tile3ClickAction() {
        tileDelegate?.onTilePress(tileID: TileId.third)
    }

    @IBAction private func firstSmallTileAction(_ sender: UIButton) {
        tileDelegate?.onTilePress(tileID: "1")
    }

    @IBAction private func secondSmallTileAction(_ sender: UIButton) {
        tileDelegate?.onTilePress(tileID: "2")
    }

    @IBAction private func thirdSmallTileAction(_ sender: UIButton) {
        tileDelegate?.onTilePress(tileID: "3")
    }
}

extension OverviewHeader: TileViewProtocol {
    public func updateTileColor(with color: UIColor) {}
    public func reloadTile(with data: TileData) {}
    
    public func addBadgeOnTile(with data: TileData) {
        switch data.tileUniqueId {
        case "1":
            largeTileBadge = Badge(view: firstLargeTile, position: .topRight)
            largeTileBadge?.updateBadgeCount(data.badgeCount!)
            smallTileBadge = Badge(view: firstSmallTile, position: .topRight)
            smallTileBadge?.updateBadgeCount(data.badgeCount!)
        case "2":
            largeTileBadge = Badge(view: secondLargeTile, position: .topRight)
            largeTileBadge?.updateBadgeCount(data.badgeCount!)
            smallTileBadge = Badge(view: secondSmallTile, position: .topRight)
            smallTileBadge?.updateBadgeCount(data.badgeCount!)
        case "3":
            largeTileBadge = Badge(view: thirdLargeTile, position: .topRight)
            largeTileBadge?.updateBadgeCount(data.badgeCount!)
            smallTileBadge = Badge(view: thirdSmallTile, position: .topRight)
            smallTileBadge?.updateBadgeCount(data.badgeCount!)
        default:
            largeTileBadge = Badge(view: firstLargeTile, position: .topRight)
            largeTileBadge?.updateBadgeCount(0)
            smallTileBadge = Badge(view: firstSmallTile, position: .topRight)
            smallTileBadge?.updateBadgeCount(0)
        }
    }

    public func updateBadge(_ badgeCount: Int) {
        largeTileBadge?.updateBadgeCount(badgeCount)
        smallTileBadge?.updateBadgeCount(badgeCount)
    }

}

extension Selector {
    static let tile1ClickAction = #selector(OverviewHeader.tile1ClickAction)
    static let tile2ClickAction = #selector(OverviewHeader.tile2ClickAction)
    static let tile3ClickAction = #selector(OverviewHeader.tile3ClickAction)
}

// MARK: - -- private functions --
extension OverviewHeader {
//configures SmallTiles
    fileprivate func setUpSmallTile(smallButton: UIButton, title: [String]) {
        smallButton.layer.cornerRadius = 15.0
        smallButton.setDropShadow()
        smallButton.alpha = 1
        let titleText = convertMultipleLinesToSingleLine(titleText: title[0])
        smallButton.setTitle(titleText, for: .normal)
        smallButton.setTitleColor(UIColor.primaryDeepBlue, for: .normal)
        smallButton.titleLabel?.font = ASTheme.font.caption2Heavy
    }
    //Check the tile text for multiple lines and convert it to single line
    fileprivate func convertMultipleLinesToSingleLine(titleText: String) -> String {
        var convertedText: String = titleText
        //Check if there is a new line in the text and replace with a space
        if convertedText.range(of: CharaterConstants.newLine) != nil {
            convertedText = convertedText.replacingOccurrences(of: CharaterConstants.newLine,
                                                               with: CharaterConstants.space)
        }
        return convertedText
    }
}
