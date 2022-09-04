//
//  Colors.swift
//  Prueba Ceiba
//
//  Created by Horacio Solorio on 03/09/22.
//

import UIKit

extension UIColor {

    static var primary: UIColor { return UIColor(hex: "0x385D33") }
    static var textColor: UIColor { return UIColor(hex: "0x444242") }
    static var mainBackground: UIColor { return UIColor(hex: "0x51177D") }

    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff

        self.init(
            red: CGFloat(red) / 0xff,
            green: CGFloat(green) / 0xff,
            blue: CGFloat(blue) / 0xff, alpha: 1
        )
    }
}
