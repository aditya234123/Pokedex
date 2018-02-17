//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit


protocol favoritesVCDelegate {
    func hideNavBarFavorites()
}

class FavoritesViewController: UIViewController {

    var pokemonArray = [Pokemon]()
    var filteredArray = [Pokemon]()
    
    var collectionView: UICollectionView!
    
    var favDelegate: favoritesVCDelegate?
    var searchDelegate: SearchControllerDelegate?
    
    var pokeIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    func getPokemon() {
        
        let defaults = UserDefaults.standard
        let savedNames = defaults.object(forKey: "savedPokemon") as! [String]
        
        pokemonArray = PokemonGenerator.getPokemonArray()
        for i in 0...(pokemonArray.count - 1) {
            let temp = pokemonArray[i]
            if savedNames.contains(temp.name) {
                filteredArray.append(temp)
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        filteredArray = [Pokemon]()
        getPokemon()
        favDelegate?.hideNavBarFavorites()
        self.navigationController?.navigationBar.isHidden = true
        collectionView.reloadData()
    }
    
    func setUpCollectionView() {
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 5, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PokeButtonCell, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PokeButtonCell
        cell.awakeFromNib()
        cell.pokeDelegate = self
        cell.setButton(num: indexPath.row)
        let url = URL(string: filteredArray[indexPath.row].imageUrl)
        if let data = try? Data(contentsOf: url!)
        {
            let image: UIImage = UIImage(data: data)!
            cell.pokeButton.setImage(image, for: .normal)
        } else {
            cell.pokeButton.setImage(UIImage(named: "search"), for: .normal)
        }
        cell.pokeButton.setTitle(filteredArray[indexPath.row].name, for: .normal)
        if let temp = cell.pokeButton.imageView?.image?.size.width {
            cell.pokeButton.titleEdgeInsets = UIEdgeInsets(top: cell.contentView.frame.height - 27, left: -temp, bottom: 10, right: 0)
        } 
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 3) - 8
        let height = width
        return CGSize(width: width, height: height)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestVC = segue.destination as! ProfileViewController
        profileVC = DestVC
        print(pokeIndex)
        DestVC.pokemon = filteredArray[pokeIndex!]
        DestVC.searchDelegate = self.searchDelegate
    }
    
    
}


extension FavoritesViewController: pokeButtonCellDelegate {
    func segue(num: Int) {
        pokeIndex = num
        print("segueing")
        //performSegue(withIdentifier: "favToProfile", sender: self)
        performSegue(withIdentifier: "favToProfile", sender: self)
    }
    
}
