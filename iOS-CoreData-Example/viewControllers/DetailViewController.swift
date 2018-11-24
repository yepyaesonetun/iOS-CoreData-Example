//
//  DetailViewController.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/24/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var ivBeer: UIImageView!
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblTagLine: UILabel!
    @IBOutlet weak var lblAlcholByVolumeValue: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblBrewersTips: UILabel!
    @IBOutlet weak var ivImageFullScreen: UIImageView!
    @IBOutlet weak var lblFoodParing: UILabel!
    @IBOutlet weak var lblIngredientsYeast: UILabel!
    @IBOutlet weak var collectionViewIngredients: UICollectionView!
    
    var beerVO: BeerVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewIngredients.dataSource = self
        collectionViewIngredients.delegate = self
        CellRegisterUtil.cellRegister(nibName: "MaltCollectionViewCell", collectionView: collectionViewIngredients)
        
        bindBeerVO(beerVO!)
        
        let onTap = UITapGestureRecognizer(target: self, action: #selector(onClickFullScreenImage))
        ivImageFullScreen.isUserInteractionEnabled = true
        ivImageFullScreen.addGestureRecognizer(onTap)
    }
    
    @objc func onClickFullScreenImage() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ZoomAbleImageViewController") as! ZoomAbleImageViewController
       
        let  imge = beerVO?.imageURL
        vc.imageUrl = imge
        self.present(vc, animated: true, completion: nil)
    }
    
    func bindBeerVO(_ beerVO: BeerVO) {
        lblBeerName.text = beerVO.name
        lblTagLine.text = beerVO.tagline
        lblBrewersTips.text = "\" \(beerVO.brewersTips) \""
        lblAlcholByVolumeValue.text = String(beerVO.abv)
        lblDescription.text = beerVO.description
        ivBeer.sd_setImage(with: URL(string:beerVO.imageURL ), placeholderImage: UIImage(named: "beer_filled_placeholder"))
        lblFoodParing.text = beerVO.foodPairing.joined(separator: "\n")
        lblIngredientsYeast.text = beerVO.ingredients.yeast
        
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaltCollectionViewCell", for: indexPath) as! MaltCollectionViewCell
        cell.beerVO = beerVO!
        return cell
    }
    
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 100)
    }
}
