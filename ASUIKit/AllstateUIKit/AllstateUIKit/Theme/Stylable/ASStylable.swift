//
//  ASTextStylable.swift
//  AllstateUIKit
//
//  Created by Vairavan, Muthuraman (INFOSYS) on 18/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import Foundation
// style related to text are added as property
public protocol ASTextStylable where Self: AnyObject {
    var textFont: UIFont { get }
    var textColor: UIColor? { get }
    var disabledTextColor: UIColor? { get }
}

// style related to color are added as property
public protocol ASColorStylable where Self: AnyObject {
    var normalBackgroundColor: UIColor? { get }
    var highlightedBackgroundColor: UIColor? { get }
    var disabledBackgroundColor: UIColor? { get }
}

// style related to layer are added as property
public protocol ASLayerStylable where Self: AnyObject {
    var hasShadow: Bool { get }
    var cornerRadius: Int { get }
}

// style related to offset are added as property
public protocol ASOffsetStylable where Self: AnyObject {
    var leadingOffset: Int { get }
}
