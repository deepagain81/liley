//
//  MirrorObject.swift
//  AllstateUIKitTests
//
//  Created by Reddy, Sushma (Technosoft) on 19/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit

class MirrorObject {
    let mirror: Mirror

    init(reflecting: Any) {
        self.mirror = Mirror(reflecting: reflecting)
    }

    func extract<T>(variableName: StaticString = #function) -> T? {
        return mirror.descendant("\(variableName)") as? T
    }
}

// Mirror classes as per xib
class ViewMirror: MirrorObject {
    init(view: UIView) {
        super.init(reflecting: view)
    }
}

class ViewControllerMirror: MirrorObject {
    init(viewController: UIViewController) {
        super.init(reflecting: viewController)
    }
}

class CollectionViewCellMirror: MirrorObject {
    init(collectionViewCell: UICollectionViewCell) {
        super.init(reflecting: collectionViewCell)
    }
}
