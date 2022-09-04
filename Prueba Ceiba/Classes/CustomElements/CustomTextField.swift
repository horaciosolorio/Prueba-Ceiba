//
//  CustomTextField.swift
//  Red Medica
//
//  Created by Tato on 26/06/21.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(
            UIResponderStandardEditActions.paste(_:)) || action == #selector(UIResponderStandardEditActions.copy(_:)
            ) {
                return false
            }
        return super.canPerformAction(action, withSender: sender)
    }
}

extension UITextField {

    func underlined() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.0
    }

    func setBottomBorderForSettings() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(
            origin: CGPoint(x: 0, y: self.frame.size.height - borderWidth),
            size: CGSize(width: self.frame.size.width, height: self.frame.size.height)
        )
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
