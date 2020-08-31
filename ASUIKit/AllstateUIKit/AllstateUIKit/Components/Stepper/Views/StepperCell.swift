//
//  StepperCell.swift
//  AllstateUIKit
//
//  Created by Reddy, Sushma (Technosoft) on 18/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit

class StepperCell: UICollectionViewCell {
    @IBOutlet private weak var stepView: UIView!

    static let reuseIdentifier = "StepperCell"
    static let nibName = "StepperCell"

    public var stepColor: UIColor? {
        didSet { stepView.backgroundColor = stepColor }
    }

    public var stepViewCornerRadius: CGFloat = 2.0 {
        didSet { stepView.layer.cornerRadius = stepViewCornerRadius }
    }

    static func nib() -> UINib {
        let bundle = Bundle.init(for: StepperCell.self)
        return UINib(nibName: String(describing: self), bundle: bundle)
    }

    static func register(with collectionView: UICollectionView) {
        collectionView.register(nib(), forCellWithReuseIdentifier: StepperCell.reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
