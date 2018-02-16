//
//  SearchViewController.swift
//  Pokedex
//
//  Created by Aditya Yadav on 2/13/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

var typeFilters = [String]()

protocol SearchControllerDelegate {
    func changeNavBarColor(color: UIColor)
    func hideNavBar()
    func setNavBarTitle(name: String)
    func setUpResultBack()
    func setUpProfileBack()
    func removeNavBarTitle()
}

class SearchViewController: UIViewController {
    
    var delegate: SearchControllerDelegate?
    var collectionView: UICollectionView!
    
    var minAttack: UITextField!
    var minDefense: UITextField!
    var minHealth: UITextField!
    
    var scrollView: UIScrollView!
    
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegate?.changeNavBarColor(color: UIColor.red)
        setUpScrollView()
        setUpCollectionView()
        //setUpNavBar()
        setUpTextInput()
    }
    
    func setUpScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.2)
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar()
    }

    
    func setUpTextInput() {
        minAttack = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20, width: view.frame.width - 40, height: 30))
        
        minDefense = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 35, width: view.frame.width - 40, height: 30))
        minHealth = UITextField(frame: CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 70, width: view.frame.width - 40, height: 30))
        
        minAttack.layer.borderColor = UIColor.black.cgColor
        minAttack.layer.borderWidth = 1
        minAttack.placeholder = " Minimum Attack Points"
        minDefense.layer.borderColor = UIColor.black.cgColor
        minDefense.layer.borderWidth = 1
        minDefense.placeholder = " Minimum Defense Points"
        minHealth.layer.borderColor = UIColor.black.cgColor
        minHealth.layer.borderWidth = 1
        minHealth.placeholder = " Minimum Health Points"
        
        scrollView.addSubview(minAttack)
        scrollView.addSubview(minDefense)
        scrollView.addSubview(minHealth)
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
        UIView.animate(withDuration: 2) {
            self.searchBar.frame.origin.x = 1000
        }
    }
    
    func searchIconPressed() {
    
        self.performSegue(withIdentifier: "toSearch", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC  = segue.destination as? ResultsViewController
        destVC?.searchDelegate = self.delegate
        if let temp = Int(minAttack.text!) {
            destVC?.minAttack = temp
        } else {
            destVC?.minAttack = 0
        }
        if let temp = Int(minDefense.text!) {
            destVC?.minDefense = temp
        } else {
            destVC?.minDefense = 0
        }
        if let temp = Int(minHealth.text!) {
            destVC?.minHealth = temp
        } else {
            destVC?.minHealth = 0
        }
        destVC?.searchBar = searchBar.text
    }
    
    func setUpCollectionView() {
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)! - 20 + 120, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        //let bgColor = UIColor(red: 18/255, green: 33/255, blue: 49/255, alpha: 1.0)
        //collectionView.backgroundColor = bgColor
        collectionView.backgroundColor = .white
        collectionView.register(SearchButtonsCell.self, forCellWithReuseIdentifier: "button")
        scrollView.addSubview(collectionView)
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
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("yo")
//    }
    
    
    
    
    
}







