//
//  CatalogModel.swift
//  session3
//
//  Created by admin on 21.03.2023.
//



import Foundation
struct CatalogModel: Codable, Hashable{
    var id: Int
    var name: String
    var description: String
    var price: String
    var category: String
    var time_result: String
    var preparation: String
    var bio: String
}
 
