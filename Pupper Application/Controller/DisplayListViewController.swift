//
//  SecondViewController.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/26/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import UIKit

class DisplayListViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let currentDogAPI = DogAPIManager()
    var y_index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getListDogData()
        setViewColors()
        collectionView?.register(HomeViewCell.self, forCellWithReuseIdentifier: DefaultValues.cellIdentifer)
        collectionView?.register(CustomHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: DefaultValues.headerIdentifer)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: DefaultValues.footerIdentifer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 16, height: 75)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultValues.cellIdentifer, for: indexPath) as! HomeViewCell
        
        if let index = navigationController?.viewControllers.index(of: self) {
            
            cell.titleLabel.text = PageData.table[index].celldata[indexPath.row]
            return cell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let index = navigationController?.viewControllers.index(of: self) {
            print(PageData.table)
            return PageData.table[index].celldata.count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        PageData.table.append(TableData(celldata: []))
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeViewCell {
            let controller = DisplayImageViewController(collectionViewLayout: UICollectionViewFlowLayout())
            controller.currentDogAPI.dynamicLink = cell.titleLabel.text!
            controller.y_index = indexPath.item
            PageData.header = cell.titleLabel.text!
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DefaultValues.headerIdentifer, for: indexPath) as! CustomHeader
            header.backgroundColor = getBackgroundColor()
            header.setText(title: PageData.header)
            return header
            
        case UICollectionElementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DefaultValues.footerIdentifer, for: indexPath)
            footer.backgroundColor = getBackgroundColor()
            return footer
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
