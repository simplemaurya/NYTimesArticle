//
//  Article.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import Foundation

struct ArticleArr:Codable{
    var results:[Article]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Article: Codable,Identifiable {
    var id = UUID()
    var published_date : String
    var byline : String
    var title : String
    var media : [MediaData]
    var abstract : String
    
    enum CodingKeys: String, CodingKey {
        case published_date, byline, title, media, abstract
    }
}

struct MediaData: Codable {
    var media_metadata : [ImageData]

//    init(icon: String, summary: String, temp: Double) {
//        self.icon = icon
//        self.summary = summary
//        self.temperature = temp
//    }
    
    enum CodingKeys: String, CodingKey {
        case media_metadata = "media-metadata"
    }
}

struct ImageData : Codable{
    var url : String
    var format : String
    var height : Int
    var width : Int
}

struct ArticleData:Identifiable{
    var id = UUID()
    public var thumbnail : String
    public var description : String
    public var author : String
    public var date : String
    public var abstract : String
    
    init(thumbnail:String="",description:String="",author:String="",date:String="",abstract:String=""){
        self.thumbnail = thumbnail
        self.description = description
        self.date = date
        self.author = author
        self.abstract = abstract
    }
}
