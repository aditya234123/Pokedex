//
//  ResultsViewController.swift
//  Pokedex
//
//  Created by Ethan Wong on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class ResultsViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    var minAttack: Int?
    var minDefense: Int?
    var minHealth: Int?
    var searchBar: String?
    
    var pokeIndex: Int?
    
    var pokemonArray = [Pokemon]()
    var filteredArray = [Pokemon]()
    
    var myTableView : UITableView!
    var reddishColor : UIColor = UIColor(red: 217/255, green: 30/255, blue: 24/255, alpha: 1.0)
    
    var label: UILabel!
    var searchDelegate: SearchControllerDelegate?
    
    override func viewDidLoad() {
        resultVC = self
        searchDelegate?.hideNavBar()
        searchDelegate?.setUpResultBack()
        self.tabBarController?.tabBar.isHidden = true
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = reddishColor
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        //self.extendedLayoutIncludesOpaqueBars = true
        view.backgroundColor = .white
        setUpSegmentControl()
        setUpTableView()
        getPokemon()
        
    }
    
    func getPokemon() {
        
        pokemonArray = PokemonGenerator.getPokemonArray()
        
        if searchBar != "" {
            for i in 0...(pokemonArray.count - 1) {
                //search for name
                let temp = pokemonArray[i]
                let name = temp.name
                if name?.range(of: searchBar!) != nil {
                    filteredArray.append(temp)
                }
            }
            
        } else {
            //category filters
            
            //types
            for i in 0...(pokemonArray.count - 1) {
                let temp = pokemonArray[i]
                let type = temp.types
                var single = true
                for i in 0...(type.count - 1) {
                    if (typeFilters.contains(type[i]) && single) {
                        
                        if (minAttack! < temp.attack && minDefense! < temp.defense && minHealth! < temp.health) {
                            
                            filteredArray.append(temp)
                            single = false
                        }
                    }
                }
            }
            
            
            
            
            
        }
        
    }
    
    
    func setUpTableView(){
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height - 166))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokeIndex = indexPath.row
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestVC = segue.destination as! ProfileViewController
        profileVC = DestVC
        DestVC.pokemon = filteredArray[pokeIndex!]
        DestVC.searchDelegate = self.searchDelegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setUpSegmentControl() {
        let items = ["Table", "Grid"]
        let segControl = UISegmentedControl(items: items)
        segControl.selectedSegmentIndex = 0
        
        segControl.frame = CGRect(x: 20, y:10, width: view.frame.width - 40, height: 40)
        
        segControl.layer.cornerRadius = 5.0
        segControl.layer.borderColor = UIColor.black.cgColor
        segControl.layer.borderWidth = 1
        segControl.backgroundColor = UIColor.white
        segControl.tintColor = UIColor.red
        
        segControl.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
        
        self.view.addSubview(segControl)
    }
    
    @objc func changeColor(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 1:
            myTableView.isHidden = true
        default:
            myTableView.isHidden = false
        }
    }
}
