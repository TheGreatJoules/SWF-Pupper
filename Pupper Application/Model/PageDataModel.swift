//
//  TableDataModel.swift
//  Pupper Application
//
//  Created by Julian Carachure on 8/27/18.
//  Copyright © 2018 juliancarachure. All rights reserved.
//

import Foundation

struct PageData {
    static var header: String = {
        //var tempArray = [HeaderData]()
        //tempArray.append(HeaderData(title: "Category"))
        var tempString = String()
        tempString = "Category"
        
        return tempString
    }()
        
    static var table: [TableData] = {
        var tempArray = [TableData]()
        tempArray.append(TableData(celldata: ["All Breeds","Sub Breed"]))
        //tempArray.append(TableData(celldata: ["All Breeds","Sub Breed","Random"]))
        return tempArray
    }()
}

struct HeaderData  {
    var title : String
}

struct TableData {
    var celldata : [String]

}


struct DefaultValues {
    static let cellIdentifer = "CellIdentifer"
    static let headerIdentifer = "HeaderIdentifer"
    static let footerIdentifer = "FooterIdentifer"
}
