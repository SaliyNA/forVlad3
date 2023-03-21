//
//  NewModel.swift
//  session3
//
//  Created by admin on 21.03.2023.
//

import Foundation
struct NewsModel: Codable, Hashable{
    var id: Int
    var name: String
    var description: String
    var price: String
    var image: String
}
