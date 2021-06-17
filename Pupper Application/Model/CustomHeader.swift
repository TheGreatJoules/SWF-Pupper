//
//  CustomHeader.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/26/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import UIKit

class CustomHeader: UICollectionViewCell {
    
    let pointsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "Avenir-Light", size: 45)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pointsLabel)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        pointsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        pointsLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(title: String) {
        pointsLabel.text = title
    }
}
