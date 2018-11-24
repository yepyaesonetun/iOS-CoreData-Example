//
//  BeerModel.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/23/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import Foundation
import CoreData

class BeerModel {
    private init() {}
    
    private static var sharedDataModel: BeerModel = {
        let beerModel = BeerModel()
        return beerModel
    }()
    
    class func shared() -> BeerModel {
        return sharedDataModel
    }
    
    func getAllBeer(context: NSManagedObjectContext,
                    success: @escaping ([BeerVO]) -> Void,
                    failure: @escaping (Error) -> Void) {
        let networkManager = NetworkManager()
        networkManager.getAllBeer(success: { (beerList) in
            DispatchQueue.main.async {
                success(beerList)
            }
        }) { (error) in
            DispatchQueue.main.async {
                failure(error)
            }
        }
    }
}
