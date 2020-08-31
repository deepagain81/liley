//
//  RowVariationAsView.swift
//  AllstateUIKit
//
//  Created by Prajapati, Vishal Babubhai (INFOSYS) on 14/01/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit

final public class RowVariationAsView: RowBaseView {

     // MARK: - Outlets
    @IBOutlet private weak var leftIcon: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelDetailSubtitle: UILabel!
    @IBOutlet private weak var labelSubtitle: UILabel!
    @IBOutlet private weak var rightIcon: UIImageView!
    var contentView: UIView!
    let nibName = "RowVariationAsView"
    public var isShadowEnabled = true
        // enum for all constants
    private enum RowConstants {
        static let zero: CGFloat = 0.0
        static let bottomSpace: CGFloat = -8.0
        static let leftIconWidth: CGFloat = 24.0
        static let leadingSpaceForTitle: CGFloat = 16.0
        static let shadowRadius: CGFloat = 3.0
        static let shadowOpacity: CGFloat = 1
        static let shadowHeight: CGFloat = 2
        static let subtitleWidth: CGFloat = 86.0
    }

    // MARK: - Local Variables
    private var rowType: RowType = .defaultVariationRowIcon
    private var rowData: RowData?
    private var isViewHighlighted = false
    //Action handlers
    private weak var rowDelegate: RowDelegate?
    private var tapGestureRecognizer: UITapGestureRecognizer!

    // Getter,setters for data
    public var title: String {
        get { return labelTitle.text ?? "" }
        set { labelTitle.text = newValue }
    }

    public var subtitle: String {
        get { return labelSubtitle.text ?? "" }
        set { labelSubtitle.text = newValue }
    }
    public var detailSubtitle: String {
        get { return labelDetailSubtitle.text ?? "" }
        set { labelDetailSubtitle.text = newValue }
    }

    public var rightImage: UIImage {
        get { return rightIcon.image ?? UIImage() }
        set { rightIcon.image = newValue }
    }

    public var leftImage: UIImage {
        get { return leftIcon.image ?? UIImage() }
        set { leftIcon.image = newValue }
    }

    public var allowTapGesture: Bool {
        set { tapGestureRecognizer.isEnabled = newValue }
        get { return tapGestureRecognizer.isEnabled }
    }

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
        guard let view = loadViewFromNib()
        else {
                return
        }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        // Give constraints to the view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.isExclusiveTouch = true
        // Initial view setup
        setUpView()
    }

    // function to load a nib.
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    public override func layoutSubviews() {
        if isShadowEnabled {
            self.dropShadow(top: false, left: true, bottom: true, right: true)
        }
    }

    // MARK: - ------- Interface functions -------
    override public func setRowDelegate(as delegate: RowDelegate) {
        rowDelegate = delegate
    }
    /// To reload the floating row with new data.
    /// - Parameter data: This used ASRowData model for providing data input
    override public func reloadRow(with data: RowData) {
        self.rowData = data
        //Refresh UI
        switch self.rowType {
        case .defaultVariationRow:
            return refreshDefaultVariationRow()
        case .defaultVariationRowIcon:
            return refreshDefaultIconVariationRow()
        default:
            return refreshDefaultVariationRow()
        }
    }

    /// Adding constraints on self for given view.
    /// - Parameter view: relative view
    func addConstraintsOn(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RowConstants.zero).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: RowConstants.zero).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: RowConstants.bottomSpace).isActive = true
    }

    // MARK: - ------- Configure rows -------
    // Configure the row to make it look like default row
    func configureDefaultVariationRowIcon(with rowContent: RowData, rowType: RowType) {
        self.rowData = rowContent
        self.rowType = rowType
        // setting up particular row depending upon type
        switch self.rowType {
        case .defaultVariationRow:
            return refreshDefaultVariationRow()
        case .defaultVariationRowIcon:
            return refreshDefaultIconVariationRow()
        default:
            return refreshDefaultVariationRow()
        }
    }

    /// This function is used to setup the default row with current data and type of floating row to be implemented
    /// - Parameters:
    ///   - rowContent: This used ASRowData model for providing data input
    ///   - rowType: This is an enum used to identify which type of row needs to setup
    public func setupDefaultVariationRowIcon(with rowContent: RowData, rowType: RowType) {
        configureDefaultVariationRowIcon(with: rowContent, rowType: rowType)
    }

    // To provide a way for selecting/deselecting a row
    public func didSelectRow(set: Bool) {
        isViewHighlighted = set
        setFloatingRowViewColor(isHighlighted: set)
    }

    // MARK: - ------ Tile Actions -------
    @IBAction func rowPressed(gesture: UITapGestureRecognizer) {
        if rowDelegate == nil && clickCompletion == nil {
            return
        }
        // Handle the tile shadow and background color on the tile press event
        if isViewHighlighted == true {
            isViewHighlighted = false
            setFloatingRowViewColor(isHighlighted: isViewHighlighted)
        } else {
            isViewHighlighted = true
            setFloatingRowViewColor(isHighlighted: isViewHighlighted)
        }
        // Notify the delegate about row press action
        notifyAboutRowClickEvent()
    }

}

// MARK: Private functions
extension RowVariationAsView {
    fileprivate func refreshDefaultVariationRow() {
        // Update data
        updateRowData()
        // Update Constraint
        leftIcon.isHidden = true
        let widthConstraint = NSLayoutConstraint(item: leftIcon!,
            attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 0)
        leftIcon.addConstraint(widthConstraint)
        self.addConstraint(NSLayoutConstraint(item: leftIcon!, attribute: .leading,
                relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0))
        // Add accessibility
        self.accessibilityElements = [labelTitle!, labelSubtitle!, labelDetailSubtitle!, rightIcon!]
        applyAccessibility(data: self.rowData!)
    }
    fileprivate func refreshDefaultIconVariationRow() {
        // Update data
        updateRowData()
        // Update Constraint
        leftIcon.isHidden = false
        // Add accessibility
        self.accessibilityElements = [leftIcon!, labelTitle!, labelSubtitle!, labelDetailSubtitle!, rightIcon!]
        applyAccessibility(data: self.rowData!)
    }

    fileprivate func updateRowData() {
        guard self.rowData != nil else {
            return
        }
        if self.rowData?.subtitle == "" {
            let widthConstraint = NSLayoutConstraint(item: labelSubtitle!,
                    attribute: NSLayoutConstraint.Attribute.width,
                    relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil,
                    attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 0)
            labelSubtitle.addConstraint(widthConstraint)
        } else {
            let widthConstraint = NSLayoutConstraint(item: labelSubtitle!,
                    attribute: NSLayoutConstraint.Attribute.width,
                    relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil,
                    attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 104)
            labelSubtitle.addConstraint(widthConstraint)
        }
        if self.rowData?.detailSubtitle == "" {
            let widthConstraint = NSLayoutConstraint(item: labelDetailSubtitle!,
                    attribute: NSLayoutConstraint.Attribute.width,
                    relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil,
                    attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 0)
            labelDetailSubtitle.addConstraint(widthConstraint)
        } else {
            let widthConstraint = NSLayoutConstraint(item: labelDetailSubtitle!,
                    attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal,
                    toItem: nil,
                    attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 240)
            labelDetailSubtitle.addConstraint(widthConstraint)
        }
        self.labelTitle.text = self.rowData?.title
        self.labelSubtitle.text = self.rowData?.subtitle
        self.labelDetailSubtitle.text = self.rowData?.detailSubtitle
        self.rightIcon.image = self.rowData?.rightIcon
        self.leftIcon.image = self.rowData?.leftIcon
    }

    // This is used to provide the text that will be used by voiceover when it is enabled
    fileprivate func applyAccessibility(data: RowData) {
        labelTitle.accessibilityLabel = data.title
        labelSubtitle.accessibilityLabel = data.subtitle
        labelDetailSubtitle.accessibilityLabel = data.detailSubtitle
    }

    // This is used to provide the initial state of the row UI
    fileprivate func setUpView() {
        // Give bottom shadow to view
        // For dynamic type support
        labelTitle.font = ASTheme.font.subheadHeavy
        labelTitle.adjustsFontForContentSizeCategory = true
        labelSubtitle.font = ASTheme.font.footnote
        labelSubtitle.textAlignment = NSTextAlignment.right
        labelSubtitle.adjustsFontForContentSizeCategory = true
        labelDetailSubtitle.font = ASTheme.font.subhead
        labelDetailSubtitle.adjustsFontForContentSizeCategory = true
        addTapGestureOnView()
    }

    // This is used to add tap gesture on the row for user interaction
    fileprivate func addTapGestureOnView() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rowPressed))
        tapGestureRecognizer.delaysTouchesBegan = true
        allowTapGesture = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    // This is used to setup the background color for default and pressed state
    fileprivate func setFloatingRowViewColor(isHighlighted: Bool) {
        if isHighlighted == true {
            contentView.backgroundColor = UIColor.greyShadow // Note: Will be accessed from the Theme
            self.removeBottomShadow()
        } else {
            contentView.backgroundColor = ASTheme.color.background // Note: Will be accessed from the Theme
            if isShadowEnabled {
                self.dropShadow(top: false, left: true, bottom: true, right: true)
            }
        }
    }

    // This is used toset setup the click event of the default row
    fileprivate func notifyAboutRowClickEvent() {
        if rowDelegate != nil {
            rowDelegate?.didPressRow(tag: self.rowData?.rowUniqueId ?? "")
        }
        if let completionBlock = clickCompletion {
            completionBlock(self.rowData?.rowUniqueId ?? "")
        }
    }

}
