//
//  CatalogViewModel.swift
//  Wsr(sessions3)
//
//  Created by admin on 21.03.2023.
//

import Foundation
import Alamofire

class CatalogViewModel: ObservableObject{
    @Published var items: [CatalogModel] = []
    @Published var itemm: CatalogModel? = nil
    
    func catalogRequest(){
        
        AF.request("https://medic.madskill.ru/api/catalog")
            .responseDecodable(of: [CatalogModel].self){ result in
                if result.value != nil {
                    self.items = result.value!
                    print("yes")
                }
//                if case .success == result.result {
//                    self.items = result.value!
//                }
//                else{
//                    print(result.error)
//                }
            }
    }
}
