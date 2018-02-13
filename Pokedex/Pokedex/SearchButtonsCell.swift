//
//  SearchButtonsCell.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class SearchButtonsCell: UICollectionViewCell {
 
    var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button = UIButton(frame: contentView.frame)
        button.layer.cornerRadius = 10
        
        contentView.addSubview(button)
        
    }
    
    func setButton(num: Int) {
        let strName = "\(num)"
        let image = UIImage(named: strName)
        self.button.setImage(image, for: .normal)
    }
    
    
    
}
