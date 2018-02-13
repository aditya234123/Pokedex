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
    
    let numToType = [1 : "BUG", 2 : "DARK", 3 : "DRAGON", 4 : "ELECTRIC", 5 : "FAIRY", 6 : "FIGHTING", 7 : "FIRE", 8 : "FLYING", 9 : "GHOST", 10 : "GRASS", 11 : "GROUND", 12 : "ICE", 13 : "NORMAL", 14 : "POISON", 15 : "PSYCHIC", 16 : "ROCK", 17 : "STEEL", 18 : "WATER"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button = UIButton(frame: contentView.frame)
        button.layer.cornerRadius = 5
        
        contentView.addSubview(button)
        
    }
    
    func setButton(num: Int) {
        let strName = "\(num)"
        let image = UIImage(named: strName)
        self.button.setImage(image, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 20)
        button.setTitle(numToType[num], for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Georgia", size: 13)
        button.titleEdgeInsets = UIEdgeInsets(top: contentView.frame.height - 27, left: -(button.imageView?.image?.size.width)!, bottom: 10, right: 0)
        let bgColor = UIColor(red: 24/255, green: 45/255, blue: 64/255, alpha: 1.0)
        button.backgroundColor = bgColor
    }
    
    
    
    
    
}
