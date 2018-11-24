//
//  MaltCell.swift
//  iOS-CoreData-Example
//
//  Created by Ye Pyae Sone Tun on 11/24/18.
//  Copyright © 2018 PrimeYZ. All rights reserved.
//

import UIKit

class MaltCell: UICollectionViewCell {

    @IBOutlet weak var lblMaltName: UILabel!
    @IBOutlet weak var lblMaltVolume: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindMalt(malt: Malt!) {
        lblMaltName.text = malt.name
        lblMaltVolume.text = String(malt.amount.value)
    }
}
