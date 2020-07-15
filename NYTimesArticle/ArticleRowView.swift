//
//  ArticleRowView.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import SwiftUI

struct ArticleRowView: View {
    var article:ArticleData
    
    var body: some View {
       HStack {
        ImageViewContainer(imageUrl: article.thumbnail)
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
           .padding(.leading,-20)
        VStack(alignment:.leading){
            Text(article.description)
            .font(.custom("Arial", size: 15))
            .fontWeight(.medium)
            .lineLimit(nil)
            //.padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 0))
            Spacer()
            HStack(){
                Text(article.author != "" ? article.author : "Anonymous")
                .lineLimit(nil)
                .font(.custom("Arial", size: 13))
                .foregroundColor(.gray)
                Spacer()
                HStack{
                    Image(systemName: "calendar")
                    .foregroundColor(.gray)
                    Text(article.date)
                    .font(.custom("Arial", size: 13))
                    .foregroundColor(.gray)
                }
               
            }
            .padding(.top,20)
        }
        //Image(systemName: "chevron.right")

        }
    }
}

//struct ArticleRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleRowView()
//    }
//}
