//
//  ViewController.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/23/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var beerListCollectionView: UICollectionView!
    
    var beerItemList: [BeerVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CellRegisterUtil.cellRegister(nibName: "BeerCollectionViewCell", collectionView: beerListCollectionView)
        self.beerListCollectionView.dataSource = self
        self.beerListCollectionView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        ProgressHUD.show("Fetching Data")
        BeerModel.shared().getAllBeer(context: managedObjectContext, success: { (beerList) in
            self.beerItemList = beerList
            self.beerListCollectionView.reloadData()
           ProgressHUD.dismiss()
        }) { (error) in
            print(error.localizedDescription)
            ProgressHUD.dismiss()
        }
    }
    
    func getBeerList()  {
        do{
            beerItemList = try self.managedObjectContext.fetch(Beer.fetchRequest()) as! [BeerVO]
            self.beerListCollectionView.reloadData()
        }catch let error as NSError {
            print("Could not fetch. \(error.userInfo)")
        }
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerItemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let beer = beerItemList[indexPath.item]
        
        let beerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as! BeerCollectionViewCell
        beerCollectionViewCell.lblBeerName.text = beer.name
        beerCollectionViewCell.ivBeerImage.sd_setImage(with: URL(string:beer.imageURL ), placeholderImage:UIImage(named:"beer_placeholder"))
        
        return beerCollectionViewCell
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat =  12
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


        //        print("\(String(describing: self.beerList[indexPath.item].ingredients!.yeast))")

        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! DetailViewController
        vc.beerVO = self.beerItemList[indexPath.item]
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

