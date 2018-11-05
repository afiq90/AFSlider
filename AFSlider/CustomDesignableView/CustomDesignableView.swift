//
//  CustomDesignableView.swift
//  AFSlider
//
//  Created by Afiq Hamdan on 11/5/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import Foundation
import UIKit

// The purpose for this CustomDesignableView to understand IBDesignable, IBInspectable to used in storyboard

@IBDesignable open class CustomDesignableView: UIView {
    
  lazy var nameLabel: UILabel =  {
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 250, height: 150))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.text = "Unable to simultaneously satisfy constraints.Probably at least one of the constraints in the following list is one you don't want.Unable to simultaneously satisfy constraints.Probably at least one of the constraints in the following list is one you don't want.imultaneously satisfy constraints.Probably at least one of the constraints in the following list is one you don't want "
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
    
//        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 250).isActive = true
    
        return label
    }()
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(nameLabel)
        nameLabel.clipsToBounds = true
        // Name Label Autolayout constraint
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
//            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
//            nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3)
        ])
        
        layoutIfNeeded()
    }
    
    
    
    private let animationDuration: TimeInterval = 1.0
    private let delayTime: TimeInterval = 0
    private let springDamping: CGFloat = 0.25
    private let lowSpringDamping: CGFloat = 0.50
    private let springVelocity: CGFloat = 8.00
    
    public enum AnimateWithDamping {
        case highDamping
        case lowDamping
    }
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
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
    
    /// The color of the shadow. Defaults to opaque black. Colors created from patterns are currently NOT supported. Animatable.
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    /// The opacity of the shadow. Defaults to 0. Specifying a value outside the [0,1] range will give undefined results. Animatable.
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

extension CustomDesignableView {
    
    //MARK:- Default Animation here
    public func animateView(withDamping damping: AnimateWithDamping) {
        
        switch damping {
        case .highDamping:
            // High Damping Custom Animation here
            provideAnimation(animationDuration: animationDuration, deleyTime: delayTime, springDamping: springDamping, springVelocity: springVelocity)
        case .lowDamping:
            // Low Damping Custom Animation here
            provideAnimation(animationDuration: animationDuration, deleyTime: delayTime, springDamping: lowSpringDamping, springVelocity: springVelocity)
        default:
            provideAnimation(animationDuration: animationDuration, deleyTime: delayTime, springDamping: lowSpringDamping, springVelocity: springVelocity)
        }
        
    }

    
    private func provideAnimation(animationDuration:TimeInterval, deleyTime:TimeInterval, springDamping:CGFloat, springVelocity:CGFloat){
        self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        UIView.animate(withDuration: animationDuration, delay: delayTime, usingSpringWithDamping: springDamping, initialSpringVelocity: springVelocity, options: .allowUserInteraction, animations: {
            self.transform = .identity
        }, completion: nil)
    }
}


