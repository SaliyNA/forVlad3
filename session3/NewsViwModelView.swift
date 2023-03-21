//
//  NewsViwModelView.swift
//  session3
//
//  Created by admin on 21.03.2023.


import Foundation
import Alamofire
class NewsViewModel: ObservableObject{
    @Published var items: [NewsModel] = []
    @Published var itemm: NewsModel? = nil
    func newsRequest(){
        AF.request("https://medic.madskill.ru/api/news")
            .responseDecodable(of: [NewsModel].self){ result in
                if result.value != nil{
                    self.items = result.value!
                }
//                if case .success == result.result{
//                    self.items = result.value!
//                }
            }
    }
}
