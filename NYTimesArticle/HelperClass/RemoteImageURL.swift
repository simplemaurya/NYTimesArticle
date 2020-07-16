//
//  RemoteImageURL.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import Foundation

class RemoteImageURL: ObservableObject{
    @Published var data = Data()
    
    init(imageUrl : String){
    
        guard let url = URL(string: imageUrl) else{ return }
    
       URLSession.shared.dataTask(with: url) { data, response, error in
     
     guard let data = data, error == nil else {
         return
     }
          
         DispatchQueue.main.async {
            self.data = data
          }
     
      }.resume()
   }
}
