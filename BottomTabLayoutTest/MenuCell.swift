//
//  MenuCell.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

class MenuCell: BaseCell {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "text"
        l.font = UIFont.boldSystemFont(ofSize: 14)
        l.textAlignment = .center
        l.textColor = ColorUtil.navigationTitleTextColor()
        return l
    }()
    
    override var isHighlighted: Bool {
        didSet {
            label.textColor = isHighlighted ? ColorUtil.tabBarTintColor() : ColorUtil.navigationTitleTextColor()
        }
    }
    override var isSelected: Bool {
        didSet {
            label.textColor = isSelected ? ColorUtil.tabBarTintColor() : ColorUtil.navigationTitleTextColor()
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        backgroundColor = ColorUtil.background()
        label.textColor = ColorUtil.navigationTitleTextColor()
    }
    override func setupViews() {
        super.setupViews()
        addSubview(label)
        
        addConstraintWithFormat(format: "H:|[v0]|", views: label)
        addConstraintWithFormat(format: "V:|[v0]|", views: label)
        
        addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        backgroundColor = ColorUtil.background()
    }
    
}
