//
//  +UICollectionViewCell.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/26/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import UIKit

extension HomeViewCell {
    func setViewColors(){
        // Cell
        self.backgroundColor = UIColor(red: myCell.red/CGFloat(255), green: myCell.green/CGFloat(255), blue: myCell.blue/CGFloat(255), alpha: 1)
    }
    
    func getBackgroundColor() -> UIColor {
        return UIColor(red: myCell.red/CGFloat(255), green: myCell.green/CGFloat(255), blue: myCell.blue/CGFloat(255), alpha: 1)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
        ])
    }
    
    func setTitleAttributes() {
        titleLabel.font = UIFont(name: "Avenir-Light", size: 24)
        titleLabel.textColor = UIColor.darkGray
    }

}

extension ImageViewCell {
    func setViewColors(){
        // Cell
        self.backgroundColor = UIColor(red: myCell.red/CGFloat(255), green: myCell.green/CGFloat(255), blue: myCell.blue/CGFloat(255), alpha: 1)
    }
    
    func getBackgroundColor() -> UIColor {
        return UIColor(red: myCell.red/CGFloat(255), green: myCell.green/CGFloat(255), blue: myCell.blue/CGFloat(255), alpha: 1)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: self.topAnchor),
            imageview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            imageview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            ])
    }
    
}
