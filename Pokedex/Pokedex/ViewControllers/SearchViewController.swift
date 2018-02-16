//
//  SearchViewController.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

protocol SearchControllerDelegate {
    func changeNavBarColor(color: UIColor)
    func hideNavBar()
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

    
    func setUpTextInput() {
        minAttack = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20, width: view.frame.width - 40, height: 30))
        
        minDefense = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 35, width: view.frame.width - 40, height: 30))
        minHealth = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 70, width: view.frame.width - 40, height: 30))
        
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
        
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width - 70, height: 20))
        var temp = UIBarButtonItem(customView: searchBar)
        self.tabBarController?.navigationItem.rightBarButtonItem = temp
        
    }
    
    func searchIconPressed() {
    
        self.performSegue(withIdentifier: "toSearch", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

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







