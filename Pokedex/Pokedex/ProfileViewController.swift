//
//  ProfileViewController.swift
//  Pokedex
//
//  Created by Ethan Wong on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var pokeImage : UIImageView!
    var typeImage : UIImageView!
    var divider : UILabel!
    var botHalf : UILabel!
    var pokeName : UILabel!
    var pokeNum : UILabel!
    var pokeHP : UILabel!
    var pokeAtt : UILabel!
    var pokeSpAtt : UILabel!
    var pokeDef : UILabel!
    var pokeSpDef : UILabel!
    var pokeSpeed : UILabel!
    var pokeTotal : UILabel!
    var pokeType1 : UILabel!
    var pokeType2 : UILabel!
    var pokeSpecies : UILabel!
    var addFavButton : UIButton!
    var toWebButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        createPokeImage()
        createPokeBioView()
        createFavButton()
        createWebButton()
        createPokeStatsView()
        //createPokeTypeImage()
        self.title = "Charizard"
    }
    
    func setUpUI(){
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.white,
             NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 21)]
        view.backgroundColor = .white
        
        divider = UILabel(frame: CGRect(x: 0, y: 320, width: view.frame.width, height: 40))
        divider.backgroundColor = .red
        divider.text = "Pokedex Data"
        divider.font = UIFont(name: "Copperplate-light", size: 20)
        divider.textColor = .white
        divider.textAlignment = .center
        view.addSubview(divider)
        
        
        botHalf = UILabel(frame: CGRect(x: 0, y: 360, width: view.frame.width, height: view.frame.height/2))
        botHalf.backgroundColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        view.addSubview(botHalf)
        
        
        //Pseudo Tab Bar
        let tabBar = UILabel(frame: CGRect(x: 0, y: view.frame.height - 40, width: view.frame.width, height: 60))
        tabBar.backgroundColor = .red
        view.addSubview(tabBar)
        
    }
    
    func createFavButton(){
        addFavButton = UIButton(frame: CGRect(x: 10, y: 265, width: 170, height: 40))
        addFavButton.setTitle("Add to Favorites", for: .normal)
        addFavButton.layer.cornerRadius = 10
        
        addFavButton.backgroundColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        view.addSubview(addFavButton)
    }
    
    func createWebButton(){
        toWebButton = UIButton(frame: CGRect(x: 195, y: 265, width: 170, height: 40))
        toWebButton.setTitle("Search on Web", for: .normal)
        toWebButton.layer.cornerRadius = 10
        toWebButton.backgroundColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        view.addSubview(toWebButton)
    }
    
    func createPokeImage() {
        let VWTH = view.frame.width
        let VHGT = view.frame.height
        
        pokeImage = UIImageView(frame: CGRect(x: 0, y: 80, width: 180, height: 180))
        pokeImage.image = UIImage(named: "charizard")
        pokeImage.contentMode = .scaleAspectFit
        view.addSubview(pokeImage)
    }
    
    func createPokeBioView() {
        //Number
        let pokeText : NSString = "No. 6" as NSString
        let range = (pokeText).range(of: "No.")
        let attribute = NSMutableAttributedString.init(string: pokeText as String)
        attribute.addAttribute(NSForegroundColorAttributeName, value: UIColor.red , range: range)
        pokeNum = UILabel(frame: CGRect(x: 170, y: 110, width: 100, height: 30))
        pokeNum.attributedText = attribute
        view.addSubview(pokeNum)
        
        //Species
        let pokeSpeciesText : NSString = "Species: Flame Pokemon" as NSString
        let range1 = (pokeSpeciesText).range(of: "Species:")
        let attribute1 = NSMutableAttributedString.init(string: pokeSpeciesText as String)
        attribute1.addAttribute(NSForegroundColorAttributeName, value: UIColor.red , range: range1)
        pokeSpecies = UILabel(frame: CGRect(x: 170, y: 140, width: 200, height: 30))
        pokeSpecies.attributedText = attribute1
        view.addSubview(pokeSpecies)
        
        //TypeLabel
        let type = UILabel(frame: CGRect(x: 170, y: 170, width: 80, height: 30))
        type.text = "Type:"
        type.textColor = .red
        pokeType1 = UILabel(frame: CGRect(x: 170, y: 205, width: 95, height: 30))
        pokeType1.text = "Fire"
        pokeType1.textColor = .white
        pokeType1.textAlignment = .center
        pokeType1.layer.cornerRadius = 10
        pokeType1.layer.borderColor = UIColor.red.cgColor
        pokeType1.layer.backgroundColor = UIColor.red.cgColor
        
        let flyingTypeColor = UIColor(red:0.26, green:0.83, blue:0.96, alpha:1.0)
        pokeType2 = UILabel(frame: CGRect(x: 270, y: 205, width: 95, height: 30))
        pokeType2.text = "Flying"
        pokeType2.textColor = .white
        pokeType2.textAlignment = .center
        pokeType2.layer.cornerRadius = 10
        pokeType2.layer.borderColor = flyingTypeColor.cgColor
        pokeType2.layer.backgroundColor = flyingTypeColor.cgColor
        
        view.addSubview(type)
        view.addSubview(pokeType1)
        view.addSubview(pokeType2)
    }
    
    func labelDefaults(_ label : UILabel){
        label.font = UIFont(name:"Copperplate-light", size: 25)
        label.textColor = .white
        view.addSubview(label)
    }
    
    func createPokeStatsView(){
        //HP
        pokeHP = UILabel(frame: CGRect(x: 50, y: 390, width: 90, height: 30))
        pokeHP.layer.cornerRadius = 10
        pokeHP.text = "HP: 78"
        labelDefaults(pokeHP)
        
        //Att
        pokeAtt = UILabel(frame: CGRect(x: 50, y: 440, width: 90, height: 30))
        pokeAtt.text = "Atk: 84"
        labelDefaults(pokeAtt)
        
        //Def
        pokeDef = UILabel(frame: CGRect(x: 50, y: 490, width: 100, height: 30))
        pokeDef.text = "Def: 78"
        labelDefaults(pokeDef)
        
        //Sp.Att
        pokeSpAtt = UILabel(frame: CGRect(x: 200, y: 390, width: 150, height: 30))
        pokeSpAtt.text = "Sp.Atk: 109"
        labelDefaults(pokeSpAtt)
        
        //Sp.Def
        pokeSpDef = UILabel(frame: CGRect(x: 200, y: 440, width: 140, height: 30))
        pokeSpDef.text = "Sp.Def: 85"
        labelDefaults(pokeSpDef)
        
        //Speed
        pokeSpeed = UILabel(frame: CGRect(x: 200, y: 490, width: 140, height: 30))
        pokeSpeed.text = "Speed: 100"
        labelDefaults(pokeSpeed)
        
        //Total
        pokeTotal = UILabel(frame: CGRect(x: view.frame.width/2 - 60, y: 550, width: 150, height: 30))
        pokeTotal.text = "Total: 534"
        labelDefaults(pokeTotal)
    }
    
}
/*
 func createPokeTypeImage(){
 typeImage = UIImageView(frame: CGRect(x: 230, y: 120, width: 120, height: 120))
 typeImage.image = UIImage(named: "7")
 typeImage.contentMode = .scaleAspectFit
 typeImage.clipsToBounds = true
 view.addSubview(typeImage)
 }
 /**
 

 //
 //  ProfileViewController.swift
 //  Pokedex
 //
 //  Created by Ethan Wong on 2/13/18.
 //  Copyright © 2018 trainingprogram. All rights reserved.
 //
 
 */*/


