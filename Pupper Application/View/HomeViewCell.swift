//
//  HomeViewCell.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/26/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    var descriptionLabel: String!
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageview = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //let textLabel = UILabel(frame: .zero)
        //textLabel.translatesAutoresizingMaskIntoConstraints = false
        //self.contentView.addSubview(textLabel)
        //self.contentView.clipsToBounds = true
        
        addSubview(titleLabel)
        setViewColors()
        setConstraints()
        setTitleAttributes()
        //self.textLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }
    
}
