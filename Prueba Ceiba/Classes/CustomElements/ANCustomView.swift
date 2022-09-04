//
//  ANCustomView.swift
//  Red Medica
//
//  Created by Horacio Solorio on 12/27/18.
//  Copyright © 2018 devFact. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

/// Computed properties, based on the backing CALayer property, that are visible in Interface Builder.
@IBDesignable open class ANCustomView: UIView {

    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

    /*
    The width of the layer's border,
     inset from the layer bounds.
     The border is composited above the layer's
     content and sublayers and includes the effects of the// swiftlint:enable force_cast `cornerRadius' property.
     Defaults to zero. Animatable.
    */
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    /*
     The color of the shadow. Defaults to opaque black.
     Colors created from patterns are currently NOT supported. Animatable.
    */
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }

    /*
     The opacity of the shadow. Defaults to 0.
     Specifying a value outside the [0,1] range will give undefined results. Animatable.
    */
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }

    /// The shadow offset. Defaults to (0, -3). Animatable.
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }

    /// The blur radius used to create the shadow. Defaults to 3. Animatable.
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
}

// Call this Function only, access from any where in your project
// Default values here
private let animationDuration: TimeInterval = 1.0
private let deleyTime: TimeInterval = 0
private let springDamping: CGFloat = 0.25
private let lowSpringDamping: CGFloat = 0.50
private let springVelocity: CGFloat = 8.00

extension ANCustomView {

    // MARK: - Default Animation here
    public func animateView() {
        provideAnimation(
            animationDuration: animationDuration,
            deleyTime: deleyTime, springDamping: springDamping,
            springVelocity: springVelocity)
    }

    // MARK: - Custom Animation here
    public func animateViewWithSpringDuration(
        _ name: UIView, animationDuration: TimeInterval,
        springDamping: CGFloat, springVelocity: CGFloat) {
            provideAnimation(
                animationDuration: animationDuration,
                deleyTime: deleyTime, springDamping: springDamping,
                springVelocity: springVelocity)
    }

    // MARK: - Low Damping Custom Animation here
    public func animateViewWithSpringDurationWithLowDamping(
        _ name: UIView,
        animationDuration: TimeInterval,
        springVelocity: CGFloat) {
        provideAnimation(
            animationDuration: animationDuration,
            deleyTime: deleyTime, springDamping: lowSpringDamping,
            springVelocity: springVelocity
        )
    }

    private func provideAnimation(
        animationDuration: TimeInterval, deleyTime: TimeInterval, springDamping: CGFloat, springVelocity: CGFloat) {
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: animationDuration,
                       delay: deleyTime,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform.identity
        })
    }
}
