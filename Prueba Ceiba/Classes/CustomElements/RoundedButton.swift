//
//  RoundedButton.swift
//  Red Medica
//
//  Created by Tato on 12/06/21.
//

import UIKit

class RoundedButton: UIButton {

    // if cornerRadius variable is set/changed, change the corner radius of the UIView
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.white {
        // Update your UI when value changes
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        // Update your UI when value changes
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}
