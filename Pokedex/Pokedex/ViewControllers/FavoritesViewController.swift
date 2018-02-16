//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        let temp = defaults.object(forKey: "savedPokemon")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
