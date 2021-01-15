//
//  UITraitCollection+Extension.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

extension UITraitCollection {
    public static var isDarkMode: Bool {
        if #available(iOS 13, *), current.userInterfaceStyle == .dark {
            return true
        }
        return false
    }

}
