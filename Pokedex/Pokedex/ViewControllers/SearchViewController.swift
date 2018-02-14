//
//  SearchViewController.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCollectionView()
        setUpNavBar()
    }
    
    func setUpNavBar() {
        let bgColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = bgColor
        
        let image = UIImage(named: "search")
        let leftBarButtonIcon = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchIconPressed))
        self.tabBarController?.navigationItem.leftBarButtonItem = leftBarButtonIcon
        
        
    }
    
    func searchIconPressed() {
     print("pressed")
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: -30, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        let bgColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        collectionView.backgroundColor = bgColor
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
        let width = (view.frame.width / 3.0) - (20 / 3)
        let height = width
        return CGSize(width: width, height: height)
    }
    
    
    
    
    
}







