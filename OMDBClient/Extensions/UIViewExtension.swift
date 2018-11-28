//
//  UIViewExtension.swift
//  Perpule
//
//  Created by Rohit on 22/07/17.
//  Copyright © 2017 Perpule. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set {
            if newValue {
                self.layer.masksToBounds = newValue
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return .clear
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor, shadowOffset: CGSize = CGSize(width: 2.0, height: 2.0), shadowOpacity: Float = 0.4, shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    func addCornerRadiusAnimation(_ from: CGFloat, to: CGFloat, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        self.layer.add(animation, forKey: "cornerRadius")
        self.layer.cornerRadius = to
    }
    
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func maskByRoundingCorners(_ masks: UIRectCorner, withRadii radii: CGSize = CGSize(width: 10, height: 10)) {
        let rounded = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: masks, cornerRadii: radii)
        
        let shape = CAShapeLayer()
        shape.path = rounded.cgPath
        
        self.layer.mask = shape
    }
    
    func roundCorners(radius: CGFloat, color: UIColor) {
        let bounds = self.bounds
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: bounds.size.width - radius * radius, y: 0))
        path.addLine(to: CGPoint(x: bounds.size.width - radius, y: 0))
        path.addArc(withCenter: CGPoint(x: bounds.size.width - radius, y: radius), radius: radius, startAngle: 3 * .pi / 2, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: bounds.size.width, y: radius * radius))
        
        path.move(to: CGPoint(x: bounds.size.width, y: bounds.size.height - radius * radius))
        path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height - radius))
        path.addArc(withCenter: CGPoint(x: bounds.size.width - radius, y: bounds.size.height - radius), radius: radius, startAngle: 0, endAngle: .pi / 2, clockwise: true)
        path.addLine(to: CGPoint(x: bounds.size.width - radius * radius, y: bounds.size.height))
        
        path.move(to: CGPoint(x: radius * radius, y: bounds.size.height))
        path.addLine(to: CGPoint(x: radius * radius, y: bounds.size.height))
        path.addArc(withCenter: CGPoint(x: radius, y: bounds.size.height - radius), radius: radius, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: bounds.size.height - radius * radius))
        
        path.move(to: CGPoint(x: 0, y: radius * radius))
        path.addLine(to: CGPoint(x: 0, y: radius))
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true)
        path.addLine(to: CGPoint(x: radius * radius, y: 0))
        
        let frameLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = path.cgPath
        frameLayer.strokeColor = color.cgColor
        frameLayer.lineWidth = 2
        frameLayer.fillColor = nil
        
        self.layer.addSublayer(frameLayer)
    }
    
    var sizeToFitView: CGFloat {
        self.layoutIfNeeded()
        return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
}
