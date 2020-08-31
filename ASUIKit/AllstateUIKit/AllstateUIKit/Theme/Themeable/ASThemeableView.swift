//
//  ASThemeableView.swift
//  ASUIKit

import Foundation

//Example of Themable component. This is done for UIView. Similar to this we can have others when required.
public class ASThemeableView: UIView, ASThemeable {

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.onViewDidLoad()
    }

    public func onViewDidLoad() {
        //override this in the subclass to set the theme when view is created
    }

    public func applyCurrentTheme() {
        //override this in the subclass to update the theme of the view when theme is changed.
        //This applicable only when app has multiple theme. For now AllState has single theme.
    }

}
