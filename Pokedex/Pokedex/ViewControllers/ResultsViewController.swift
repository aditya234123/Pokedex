//
//  ResultsViewController.swift
//  Pokedex
//
//  Created by Ethan Wong on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class ResultsViewController: ViewController {
    
    var label: UILabel!

    override func viewDidLoad() {
        
        var delegate: SearchControllerDelegate?
        self.tabBarController?.tabBar.isHidden = true
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .red
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        d()
        
}
    func d () {
        let items = ["Table", "Grid"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        let frame = UIScreen.main.bounds
        customSC.frame = CGRect(x:frame.minX + 10, y:frame.minY + 50, width: frame.width - 20, height: frame.height*0.1)
        
        customSC.layer.cornerRadius = 5.0
        customSC.backgroundColor = UIColor.black
        customSC.tintColor = UIColor.white
        
        customSC.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
        
        self.view.addSubview(customSC)
    }
    
    @objc func changeColor(sender: UISegmentedControl) {
        print("Change color handler is called.")
        print("Changing Color to ")
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.green
            print("Green")
        case 2:
            self.view.backgroundColor = UIColor.blue
            print("Blue")
        default:
            self.view.backgroundColor = UIColor.purple
            print("Purple")
        }
    }
}
