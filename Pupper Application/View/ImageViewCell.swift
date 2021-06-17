//
//  ImageViewCell.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/29/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    var descriptionLabel: String!
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageview: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //let textLabel = UILabel(frame: .zero)
        //textLabel.translatesAutoresizingMaskIntoConstraints = false
        //self.contentView.addSubview(textLabel)
        //self.contentView.clipsToBounds = true
        
        //addSubview(titleLabel)
        addSubview(imageview)
        setViewColors()
        setConstraints()
        //self.textLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }
    
}
