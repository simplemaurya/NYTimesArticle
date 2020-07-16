//
//  DetailedArticleView.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import SwiftUI

struct DetailedArticleView: View {
    var article:ArticleData
    
    var body: some View {
        VStack(alignment:.leading){
            ImageViewContainer(imageUrl: article.thumbnail)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
            Text(article.description)
            .font(.custom("Arial", size: 18))
            .fontWeight(.medium)
            .lineLimit(nil)
            .foregroundColor(.white)
            .padding()
            .padding(.top,20)
            //.padding(.top,-200)
            HStack(){
                Text(article.author != "" ? article.author : "Anonymous")
                .lineLimit(nil)
                .font(.custom("Arial", size: 13))
                .foregroundColor(.white)
                //Spacer()
                HStack{
                    Image(systemName: "calendar")
                    .foregroundColor(.white)
                    Text(article.date)
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.custom("Arial", size: 13))
                   .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top,-20)
            //.padding(.top,10)
            Text(article.abstract)
            .font(.custom("Arial", size: 16))
            .lineLimit(nil)
            .foregroundColor(.white)
            .padding()
            .padding(.top,10)
            Spacer()
        }
        .background(articleBgColor)
        
    }
}

//struct DetailedArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedArticleView()
//    }
//}
