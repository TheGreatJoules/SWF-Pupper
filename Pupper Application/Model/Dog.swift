//
//  AllDogs.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/27/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import Foundation

struct allDog: Codable {
    let status: String
    let message: [String:[String]]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
    }
                                
}

struct allDogImages: Codable {
    let status: String
    let message: [String]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
    }
    
}

struct allDogImagesRandom: Codable {
    let status: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
    }
    
}
