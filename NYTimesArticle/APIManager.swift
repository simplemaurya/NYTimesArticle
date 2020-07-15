//
//  APIManager.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import Foundation

class APIManager: ObservableObject{
    
func  mostPopularArticleAPI(period:Int,
             success:@escaping (_ array: [Article]?) -> Void,
             failure:@escaping (_ error: Error) -> Void){
    
    let url = "\(NYTimesApiUrl)\(period).json?api-key=\(NYTimesApiKey)"
    
    URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
     
     guard let data = data, error == nil else {
         success(nil)
         return
     }
     
     let response = try? JSONDecoder().decode(ArticleArr.self, from: data)
     if let response = response {
         DispatchQueue.main.async {
            success(response.results)
         }
     }
     
 }.resume()
}
}
