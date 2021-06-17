//
//  +HomeViewController.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/26/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import UIKit

extension UICollectionViewController {
    func setViewColors(){
        // TableView
        collectionView?.backgroundColor = UIColor(red: myBackground.red/CGFloat(255), green: myBackground.green/CGFloat(255), blue: myBackground.blue/CGFloat(255), alpha: 1)
    }
    
    func getBackgroundColor() -> UIColor {
        return UIColor(red: myBackground.red/CGFloat(255), green: myBackground.green/CGFloat(255), blue: myBackground.blue/CGFloat(255), alpha: 1)
    }
    
    func setNavigation(title: String) {
        self.navigationItem.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

extension DisplayListViewController {
    func getListDogData() {
        currentDogAPI.getListDogs() { (allDog,error) in
            if let error = error {
                print("Get allDog error: \(error.localizedDescription)")
                return
            }
            
            guard let allPuppers = allDog  else { return }
            
            if let index = self.navigationController?.viewControllers.index(of: self) {
                print(index)
                PageData.table[index] = (TableData(celldata: []))
                switch (self.y_index) {
                    case 0:
                        print("HERE1")
                        PageData.table[index] = TableData(celldata: allPuppers.message.keys.sorted())
                        break
                    case 1:
                        print("HERE2")
                        var subDoggo = [String]()
                        for (key,value) in allPuppers.message {
                            if value.isEmpty == false {
                                //print(key)
                                subDoggo.append(key)
                            }
                        }
                        PageData.table[index] = TableData(celldata: subDoggo.sorted())
                        break
                    default :
                        print("HERE3")
                        break

                }
            }
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
        
    }
}


extension DisplayImageViewController {
    func getRandomImageDogData() {
        self.currentDogAPI.getRandomImagesDogs() { (allDogImagesRandom,error) in
            if let error = error {
                print("Get allDog error: \(error.localizedDescription)")
                return
            }
            
            guard let allPuppers = allDogImagesRandom  else { return }
            let pupperArray = [allPuppers.message]
            if let index = self.navigationController?.viewControllers.index(of: self) {
                PageData.table[index] = TableData(celldata: pupperArray)
            }
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }

    }
    
    func getImageDogData() {
        
        self.currentDogAPI.getImagesDogs() { (allDogImages,error) in
            if let error = error {
                print("Get allDog error: \(error.localizedDescription)")
                return
            }
            
            guard let allPuppers = allDogImages  else { return }
            print(allPuppers.message)
            if let index = self.navigationController?.viewControllers.index(of: self) {
                PageData.table[index] = TableData(celldata: allPuppers.message)
                print(PageData.table[index])
                
            }
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
    
    }
    
}





















