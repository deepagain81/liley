//
//  TileAsView.swift
//  ASUIKit

import Foundation

//The Tile View on the ground
final public class TileAsView: ASThemeableView, XibViewGettable, TileViewProtocol {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelsStackView: UIStackView!
    @IBOutlet private weak var contentView: UIView!

    //Action handlers
    private var clickCompletion: OnTileClick?
    private weak var tileDelegate: TileDelegate?

    //Data states
    private var touchState: Bool = false
    private var tileType: TileType = .agent
    private var tileData: TileData?

    //Update here if needs to apply the current theme on the tile being contructred.
    override public func onViewDidLoad() {

    }

    // MARK: - ------- To load from the nib -------
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initWithSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initWithSubviews()
    }

    func initWithSubviews() {
        let nib = TileAsView.getNib()
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    // MARK: - ------- Interface functions -------
    func setTileActionCallback(_ onClick: @escaping OnTileClick) {
        self.clickCompletion = onClick
        registerForTileTap()
    }

    public func setTileDelegate(as delegate: TileDelegate) {
        tileDelegate = delegate
        registerForTileTap()
    }

    public func updateTileColor(with color: UIColor) {
        containerView.backgroundColor = color
    }

    public func reloadTile(with data: TileData) {
        self.tileData = data

        //Refresh UI
        switch self.tileType {
        case .agent:
            refreshAgentTile()
        case .quickAccess:
            refreshQuickAccessTile()
        case .idCard:
            refreshIdCardTile()
        case .promo:
          refreshIdCardTile()
      }
    }

    // MARK: - ------- Configure tiles -------
    /// Populate the content in Quick Access Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    func configureQuickAccess(with tileContent: TileData) {
        self.tileData = tileContent
        self.tileType = .quickAccess
        refreshQuickAccessTile()
    }

    /// Populate the content in Agent Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    func configureAgentTile(with tileContent: TileData) {
        self.tileData = tileContent
        self.tileType = .agent
        refreshAgentTile()
    }

    /// Populate the content in Id Card Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    func configureIdCardTile(with tileContent: TileData) {
        self.tileData = tileContent
        self.tileType = .idCard
        refreshIdCardTile()
    }
    /// Populate the content in Promo Tile
    /// - Parameter tileContent: Dynamic data from the model, ASTileData
    func configurePromoTile(with tileContent: TileData) {
        self.tileData = tileContent
        self.tileType = .promo
        refreshIdCardTile()
    }

    // MARK: - ------ Tile Actions -------
    @IBAction func tilePressed(gesture: UILongPressGestureRecognizer) {
        guard let tileDelegate = tileDelegate else {
            return
        }
        guard let clickCompletion = clickCompletion else {
            return
        }
        //Handle the tile shadow and background color on the tile press event
        if gesture.state == .began {
            containerView.backgroundColor = .lightGray
            self.layer.shadowOpacity = 0.0
        } else if  gesture.state == .ended {
            containerView.backgroundColor = .white
            self.layer.shadowOpacity = 0.5

            //Notify the delegate about tile press action
            notifyAboutTileClickEvent(tileDelegate: tileDelegate, clickCompletion: clickCompletion)
        }
    }

}

// MARK: Private functions
extension TileAsView {

    fileprivate func refreshQuickAccessTile() {
        setupImageView()
        setupLabelsView()
    }

    fileprivate func refreshIdCardTile() {
        labelsStackView.alignment   = .leading
        imageView.isHidden          = true
        setupLabelsView()
    }

    fileprivate func refreshAgentTile() {
        labelsStackView.alignment   = .leading
        mainStackView.axis          = .horizontal
        setupImageView()
        setupLabelsView()
    }

    //Update the tile image
    fileprivate func setupImageView() {
        if let data = self.tileData {
            imageView.image = data.tileImage
        }
    }

    //Create and update the tile texts
    fileprivate func setupLabelsView() {

        guard let data = self.tileData else {
            return
        }

        var index = 0
        for text in data.tileMessages {
            let label           = UILabel()
            label.numberOfLines = 2
            label.text          = text
            label.textAlignment = .center
            if index == 0 {
                updateFont(for: label)
            } else {
                label.font = ASTheme.font.subhead
            }

            labelsStackView.addArrangedSubview(label)
            index += 1
        }
    }

    fileprivate func updateFont(for lable: UILabel?) {
        guard let uiLable = lable  else {
            return
        }
        switch self.tileType {
        case .agent:
            uiLable.font = ASTheme.font.caption2Heavy
        case .quickAccess:
            uiLable.font = ASTheme.font.subhead
        case .idCard:
            uiLable.font = ASTheme.font.subhead
        case .promo:
          uiLable.font = ASTheme.font.subhead
      }
    }

    fileprivate func registerForTileTap() {
        let tapGesuture = UILongPressGestureRecognizer(target: self, action: #selector(tilePressed))
        tapGesuture.minimumPressDuration = 0.0
        containerView.addGestureRecognizer(tapGesuture)
    }

    fileprivate func notifyAboutTileClickEvent(tileDelegate: TileDelegate, clickCompletion: OnTileClick) {
        tileDelegate.onTilePress(tileID: self.tileData?.tileUniqueId ?? "")
        clickCompletion(self.tileData?.tileUniqueId ?? "")
    }
}
