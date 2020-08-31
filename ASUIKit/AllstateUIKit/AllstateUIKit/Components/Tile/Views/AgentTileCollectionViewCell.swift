//
//  AgentTileCollectionViewCell.swift
//  AllstateUIKit
//

import UIKit

public class AgentTileCollectionViewCell: UICollectionViewCell {
    // MARK: - Local Variables
    public static let cellIdentifier = "AgentTileCollectionViewCell"
    @IBOutlet private weak var agentTileButton: TileAsButton!
    private var agentTileData: TileData!
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    static public var nib: UINib {
        let bundle = Bundle.init(for: AgentTileCollectionViewCell.self)
        return UINib.init(nibName: String(describing: self), bundle: bundle)
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    ///Initial setup for Agent Tile View
    /// - Parameter tileData: Dynamic data from model ASTileData
    public func setUpAgentTileCell(with tileData: TileData) {
        agentTileData = tileData
        agentTileButton.configureAgentTile(with: agentTileData)
        agentTileButton.isUserInteractionEnabled = true
    }

    public func setTileAction() -> TileAsButton {
        return agentTileButton
    }
}
