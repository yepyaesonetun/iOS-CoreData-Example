//
//  ZoomAbleImageViewController.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/24/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class ZoomAbleImageViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var svZoomImage: UIScrollView!
    @IBOutlet weak var ivBeerImage: UIImageView!
    var gradientLayer:CAGradientLayer!
    var imageUrl:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ivBeerImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "beer_placeholder"))
        
        svZoomImage.delegate = self
        svZoomImage.minimumZoomScale = 1.0
        svZoomImage.maximumZoomScale = 5.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return ivBeerImage
    }
    
    @IBAction func onClickCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
