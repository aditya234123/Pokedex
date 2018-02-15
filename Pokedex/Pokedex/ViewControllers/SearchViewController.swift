//
//  SearchViewController.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit
import ViewAnimator

protocol SearchControllerDelegate {
    func changeNavBarColor(color: UIColor)
}


class SearchViewController: UIViewController {
    
    var delegate: SearchControllerDelegate?
    var collectionView: UICollectionView!
    
    var minAttack: UITextField!
    var minDefense: UITextField!
    var minHealth: UITextField!
    
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegate?.changeNavBarColor(color: UIColor.red)
        setUpCollectionView()
        setUpNavBar()
        setUpTextInput()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.animateRandom()
    }
    
    
    func setUpTextInput() {
        minAttack = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20, width: view.frame.width - 40, height: 30))
        minAttack.layer.cornerRadius = 5
        minDefense = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 35, width: view.frame.width - 40, height: 30))
        minDefense.layer.cornerRadius = 5
        minHealth = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 70, width: view.frame.width - 40, height: 30))
        minHealth.layer.cornerRadius = 5
        
        
        minAttack.layer.borderColor = UIColor.black.cgColor
        minAttack.layer.borderWidth = 1
        minAttack.placeholder = "Minimum Attack Points"
        minDefense.layer.borderColor = UIColor.black.cgColor
        minDefense.layer.borderWidth = 1
        minDefense.placeholder = "Minimum Defense Points"
        minHealth.layer.borderColor = UIColor.black.cgColor
        minHealth.layer.borderWidth = 1
        minHealth.placeholder = "Minimum Health Points"
        
        view.addSubview(minAttack)
        view.addSubview(minDefense)
        view.addSubview(minHealth)
    }
    
    func setUpNavBar() {
        
        self.navigationController?.navigationBar.isHidden = true
        let image = UIImage(named: "search")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        let leftBarButtonIcon = UIBarButtonItem(image: tintedImage, style: .plain, target: self, action: #selector(searchIconPressed))
        self.tabBarController?.navigationItem.leftBarButtonItem = leftBarButtonIcon
        self.tabBarController?.navigationItem.leftBarButtonItem?.tintColor = .white
        
    }
    
    func searchIconPressed() {
        print("pressed")
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 20))
        UIView.animate(withDuration: 2) {
            var temp = UIBarButtonItem(customView: self.searchBar)
            self.tabBarController?.navigationItem.leftBarButtonItem = temp
        }
        
        
        
        
    }
    
    func setUpCollectionView() {
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 120, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        //let bgColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        //collectionView.backgroundColor = bgColor
        collectionView.backgroundColor = .white
        collectionView.register(SearchButtonsCell.self, forCellWithReuseIdentifier: "button")
        view.addSubview(collectionView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "button", for: indexPath) as! SearchButtonsCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! SearchButtonsCell
        cell.setButton(num: indexPath.item + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 4.0) - (25 / 4)
        let height = width
        return CGSize(width: width, height: height)
    }
    
    
    
    
    
}







