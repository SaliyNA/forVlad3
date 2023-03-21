//
//  CatalogView.swift
//  Wsr(sessions3)
//
//  Created by admin on 21.03.2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct CatalogView: View {
    @State var search = ""
    @StateObject var viewModel = CatalogViewModel()
    @StateObject var viewModel2 = NewsViewModel()
    var body: some View {
        VStack{
            ZStack{
                Image("search")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .padding(.trailing, 300)
                    .frame(width: 335,height: 48)
                    .background(Color("gg"))
                    .cornerRadius(10)
                    .padding(1)
                    .background(Color("gggg"))
                    .cornerRadius(10)
                TextField("Искать анализы", text:$search)
                    .frame(width: 335,height: 48).padding(.leading, 60)
            }
             
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(viewModel2.items, id:\.self){ item2 in
                        ZStack{
                            HStack{
                                Spacer()
//                                    для картинки по URL и кэщирования
                                AsyncImage(url: URL(string:item2.image.replacingOccurrences(of: " ", with: "%20"))){ image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 152)
                                } placeholder: {
                                 //   Image(systemName: "globe")
                                }
//                             //   WebImage(url: URL(string:item2.image.replacingOccurrences(of: " ", with: "%20")))
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: 152)
                            }
                            
                            VStack(alignment: .leading){
                                Text(item2.name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                   
                                Text(item2.description)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13))
                                    .padding(.bottom, 20)
                                    Text(item2.price+"Р")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                            }  .frame(width:176, height: 122)
                                .offset(x: -40)
                            
                        }.frame(width:270,height:152)
                            .background(item2.id % 2 == 0 ?
                                        LinearGradient(colors: [Color("gr2"), Color("lb")], startPoint: .leading, endPoint: .trailing) :
                                            LinearGradient(colors: [Color("nnnb"), Color("nnnb1")], startPoint: .leading, endPoint: .trailing)
                            ).cornerRadius(20)
                    }
                }
            }//.padding(.leading, 20)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(viewModel.items, id:\.self){ item in
                        Text("")
                    }.border(.black)
                }
            }
        }.onAppear{
            viewModel.catalogRequest()
            viewModel2.newsRequest()
            //для кэширования
            URLCache.shared.memoryCapacity = 1_000_000
            URLCache.shared.diskCapacity = 1_000_000_000
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
