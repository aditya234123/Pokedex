//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let searchViewController = SearchViewController()
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.tabBarItem.title = "Filter"
        searchNavController.tabBarItem.image = UIImage(named: "filter")
        
        let favoritesViewController = FavoritesViewController()
        let favNavController = UINavigationController(rootViewController: favoritesViewController)
        favNavController.tabBarItem.title = "Favorites"
        favNavController.tabBarItem.image = UIImage(named: "star")
        
        let bgColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        self.tabBar.barTintColor = bgColor
        
        viewControllers = [searchNavController, favNavController]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

