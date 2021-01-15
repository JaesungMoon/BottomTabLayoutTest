//
//  ColorUtil.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/16.
//

import UIKit

class ColorUtil {
    static func navigationTitleTextColor() -> UIColor {
        if UITraitCollection.isDarkMode {
            return UIColor.white
        } else {
//            UIColor.colorWithDecimal(red: <#T##Float#>, green: <#T##Float#>, blue: <#T##Float#>)
            return UIColor.black
//            return UIColor.colorWithHex(color24: 0x666666)
        }
    }
    static func tabBarTintColor() -> UIColor {
//        return UIColor.colorWithHex(color24: 0x51bbde)
        return UIColor.orange
    }
    static func background() -> UIColor {
        return UIColor.blue
    }

}
