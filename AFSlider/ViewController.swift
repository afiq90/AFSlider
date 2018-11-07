//
//  ViewController.swift
//  AFSlider
//
//  Created by Afiq Hamdan on 11/2/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customDesignableView: CustomDesignableView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        guard let slider = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as? SliderView else {return}
        print("main screen view  width \(UIScreen.main.bounds.size.width)")
        print("main view frame width \(view.frame.size.width)")
        print("main view bounds width \(view.bounds.size.width)")

        setupSlider(with: slider)
        setupConstraint(with: slider)
        /* Set the width here based on leading,trailing constraint constant which is need to substract the total of the width view with total leading and trailing constant.
          WIDTH = VIEW WIDTH - (LEADING + TRAILING CONSTRAINT CONSTANT)
            Set the height based on height constraint. the slider height is 200. Need to add slider height with height constraint
          HEIGHT = SLIDER HEIGHT + HEIGHT CONSTRAINT CONSTANT OR
          HEIGHT = SLIDER HEIGHT - VALUE THAT NEED TO MATCH THE HEIGHT CONSTANT
        */
        slider.createSlider(width: view.frame.size.width - 50, height: slider.bounds.size.height + 50)
        customDesignableView.animateView(withDamping: .lowDamping)
        
    }
    
    func setupSlider(with slider: SliderView) {
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = UIColor.clear
//        debugView(slider: slider)
        view.addSubview(slider)
        sliderViewAnimation(slider: slider)
    }
    
    func setupConstraint(with slider: SliderView) {
//        slider.invalidateIntrinsicContentSize()
        
        // Slider AutoLayout
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            slider.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        //CustomDesignableView AutoLayout
        customDesignableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customDesignableView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 5),
            customDesignableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            customDesignableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            customDesignableView.widthAnchor.constraint(equalToConstant: customDesignableView.frame.size.width),
            customDesignableView.heightAnchor.constraint(equalToConstant: customDesignableView.frame.size.height)
        ])
        

//        slider.sliderScrollView.leadingAnchor.constraint(equalTo: slider.leadingAnchor)
//        slider.sliderScrollView.trailingAnchor.constraint(equalTo: slider.trailingAnchor)
//        slider.sliderScrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        
//        slider.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
//        slider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1, constant: 0).isActive = true
//        slider.sliderScrollView.widthAnchor.constraint(equalTo: slider.widthAnchor)
//        slider.setNeedsUpdateConstraints()

//        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true


    }
    
    
    func sliderViewAnimation(slider: SliderView) {
        slider.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.5) {
            slider.transform = .identity
        }
    }
    
    func debugView(slider: SliderView) {
        slider.layer.borderColor = UIColor.green.cgColor
        slider.sliderScrollView.layer.borderColor = UIColor.red.cgColor
        slider.sliderScrollView.layer.borderWidth = 5.0
        slider.layer.borderWidth = 3.0
        
        print("main slider x \(slider.frame.origin.x)")
        print("main slider y \(slider.frame.origin.y)")
        
        print("main slider height \(slider.frame.size.height)")
        print("main slider width \(slider.frame.size.width)")
        print("main slider scrollview width \(slider.sliderScrollView.frame.size.width)")
    }

//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        <#code#>
//    }

}

