//
//  MaltCollectionViewCell.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/24/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class MaltCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewMalt: UICollectionView!
    var beerVO: BeerVO? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionViewMalt.dataSource  = self
        self.collectionViewMalt.delegate = self
        
        CellRegisterUtil.cellRegister(nibName: "MaltCell", collectionView: collectionViewMalt)
    }
    
}

extension MaltCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (beerVO?.ingredients.malt.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaltCell", for: indexPath) as! MaltCell
        cell.bindMalt(malt: (beerVO?.ingredients.malt[indexPath.item]))
        return cell
    }
}

extension MaltCollectionViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: self.collectionViewMalt.frame.height)
    }
}
