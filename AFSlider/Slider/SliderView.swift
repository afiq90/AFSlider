//
//  SliderView.swift
//  AFSlider
//
//  Created by Afiq Hamdan on 11/2/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import UIKit

class SliderView: UIView {

    @IBOutlet weak var sliderTitleLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var sliderScrollView: UIScrollView!
    
    var sliderImageArray: [UIImage] = [#imageLiteral(resourceName: "HomeA"),#imageLiteral(resourceName: "HomeB"),#imageLiteral(resourceName: "HomeC"),#imageLiteral(resourceName: "HomeD")]
//    var sliderImageArray: [UIImage] = [UIImage(named: "HomeA"), UIImage(named: "HomeB"), UIImage(named: "HomeC"), UIImage(named: "HomeD")] as! [UIImage]
    var sliderTitle: [String] = ["iPhone X", "iPhone Xs", "iPhone Xs Max", "iPad Pro"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sliderScrollView.delegate = self
        sliderScrollView.isPagingEnabled = true
//        sliderScrollView.alwaysBounceVertical = false
//        sliderScrollView.alwaysBounceHorizontal = true
//        sliderScrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = sliderImageArray.count

    }
    
    func createSlider(width: CGFloat, height: CGFloat) {
        
//        let width = width
//        let height = self.bounds.size.height
        let contentSizeWidth = Int(width) * (sliderImageArray.count)

        sliderScrollView.contentSize = CGSize(width: contentSizeWidth, height: Int(height))
        print("slider view width: \(width)")

        print("slider view height: \(height)")

        print("scrollview content size: \(sliderScrollView.contentSize)")
        
        
        for (i, element) in sliderImageArray.enumerated() {
            print("index: \(i)")
            print("title name: \(sliderTitle[i])")
            
            let imageView = UIImageView(frame: CGRect(x: i * Int(width), y: 0, width: Int(width), height: Int(height)))
            
            print("image frame: \(imageView.frame)")
            imageView.image = element
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            
//            debugView(imageView: imageView)

          
            sliderScrollView.addSubview(imageView)
            
            

        }
        
        sliderTitleLabel?.text = sliderTitle[0]

//        for i in 0 ..< sliderImageArray.count {
        
            //set the imageview constraint
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.topAnchor.constraint(equalTo: sliderScrollView.topAnchor).isActive = true
//            imageView.leadingAnchor.constraint(equalTo: sliderScrollView.leadingAnchor).isActive = true
//            imageView.trailingAnchor.constraint(equalTo: sliderScrollView.trailingAnchor).isActive = true
//            imageView.bottomAnchor.constraint(equalTo: sliderScrollView.bottomAnchor).isActive = true
//        }
        

    }
    
    func debugView(imageView: UIImageView) {
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 4.0
    }

}

extension SliderView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("scroll view x offset: \(sliderScrollView.contentOffset)")

//        scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x, y: 0), animated: true)

        let width = self.bounds.size.width
        let pageWidth = width
        
        let page = round(sliderScrollView.contentOffset.x / pageWidth)
//         let page = round(sliderScrollView.contentOffset.x / sliderScrollView.frame.size.width)


        print("current page : \(page)")
//        if sliderScrollView.contentOffset.x <= pageWidth {
            sliderTitleLabel.text = sliderTitle[Int(page)]
            pageControl.currentPage = Int(page)
//        }
      
    }
    
}
