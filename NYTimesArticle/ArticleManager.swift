//
//  ArticleManager.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import Foundation

class ArticleManager: ObservableObject{
@Published var articleArr = [ArticleData]()
@Published var loading = false

    func fetchArticle(period:Int) {
        self.loading = true
        APIManager().mostPopularArticleAPI(period: period, success: { (articleArr) in
            self.loading = false
            if let arr = articleArr{
                for i in 0...arr.count-1{
                    var article = ArticleData()
                    article.author = arr[i].byline
                    article.description = arr[i].title
                    article.date = arr[i].published_date
                    article.abstract = arr[i].abstract
                    article.thumbnail = arr[i].media[0].media_metadata[2].url
                    self.articleArr.append(article)
                }
            }            
        }) { (error) in
        print(error)
        }
    }
}
