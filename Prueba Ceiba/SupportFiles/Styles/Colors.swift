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
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    
}
