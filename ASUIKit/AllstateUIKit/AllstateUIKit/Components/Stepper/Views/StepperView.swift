//
//  StepperView.swift
//  AllstateUIKit
//
//  Created by Reddy, Sushma (Technosoft) on 18/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit

public class StepperView: ASThemeableView, XibViewGettable {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionview: UICollectionView!

    // MARK: - Configuration variables
    public var totalSteps: Int = 0 {
        didSet { reloadStepperView() }
    }

    public var itemSpacing: CGFloat = 1.0 {
        didSet { reloadStepperView() }
    }

    public var stepHeight: CGFloat = 4.0 {
        didSet { reloadStepperView() }
    }

    public var currentStepNumber: Int = 1 {
        didSet { collectionview.reloadData() }
    }

    public var stepCornerRadius: CGFloat = 2.0 {
        didSet { reloadStepperView() }
    }

    public var defaultStepColor: UIColor = UIColor.grey3 ?? UIColor.lightGray {
        didSet { collectionview.reloadData() }
    }

    public var highlightedStepColor: UIColor = UIColor.primaryBlue ?? UIColor.blue {
        didSet { collectionview.reloadData() }
    }

    public var title: String? {
        set { titleLabel.text = newValue }
        get { return titleLabel.text }
    }

    public var titleColor: UIColor? {
        set { titleLabel.textColor = newValue }
        get { return titleLabel.textColor }
    }

    public var titleFont: UIFont? {
        set { titleLabel.font = newValue }
        get { return titleLabel.font }
    }

    // MARK: -
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        initialSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        initialSetup()
    }

    public func configure(totalSteps: Int, currentStepNumber: Int, title: String) {
        self.totalSteps = totalSteps
        self.currentStepNumber = currentStepNumber
        self.title = title
        reloadStepperView()
    }

    private func applyDropShadow() {
        self.dropShadow(top: false, left: true, bottom: true, right: true)
        self.layer.zPosition = .greatestFiniteMagnitude
    }

    public func removeDropShadow() {
        self.removeBottomShadow()
    }
}

// MARK: - Initial view setup
extension StepperView {

    private func initialSetup() {
        initView()
        setupCollectionView()
        defaultConfiguration()
    }

    // To initialize the nib and constraints for the view
    private func initView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

    // function to load a nib.
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func defaultConfiguration() {
        title = ""
        titleColor = UIColor.primaryDeepBlue
        titleFont = ASTheme.font.textRegular17
        applyDropShadow()
    }

    private func setupCollectionView() {
        self.collectionview.dataSource = self
        registerCell()
        setupCollectionviewFlowLayout()
    }

    private func registerCell() {
        StepperCell.register(with: collectionview)
    }

    private func setupCollectionviewFlowLayout() {
        let screenWidth = collectionview.frame.width
        let width = screenWidth/CGFloat(totalSteps) - itemSpacing

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: stepHeight)
        layout.minimumInteritemSpacing = itemSpacing
        collectionview.collectionViewLayout = layout
        collectionview.reloadData()
    }

    public func reloadStepperView() {
        if currentStepNumber <= 0 || currentStepNumber > totalSteps {
            return
        }
        setupCollectionviewFlowLayout()
        layoutIfNeeded()
    }
}

// MARK: - UICollectionViewDataSource
extension StepperView: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSteps
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StepperCell.reuseIdentifier,
                                                            for: indexPath) as? StepperCell else {
            return UICollectionViewCell()
        }
        cell.stepViewCornerRadius = stepCornerRadius
        cell.stepColor = defaultStepColor

        if indexPath.item <= currentStepNumber - 1 {
            cell.stepColor = highlightedStepColor
        }
        return cell
    }
}
