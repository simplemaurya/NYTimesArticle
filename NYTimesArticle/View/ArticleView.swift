//
//  ContentView.swift
//  NYTimesArticle
//
//  Created by AAPNA on 14/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    @ObservedObject var model = ArticleManager()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var username : String
    @Binding var email : String
    @Binding var password : String
    
    var body: some View {
       // NavigationView{
        LoadingView(isShowing: $model.loading){
        List{
           ForEach(self.model.articleArr) { (arr:ArticleData) in
            NavigationLink(destination: DetailedArticleView(article: arr)) {
            ArticleRowView(article: arr)
                .padding()
                
             }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("Home"),displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.logout()
            }) {
                Image(systemName: "power")
                .accentColor(.white)
            }
        )
        .onAppear(){
        self.username = ""
        self.email = ""
            self.password = ""
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = false
          self.callArticleApi()
           }
        }
    }
    
    func logout(){
        UserDefaults.standard.removeObject(forKey: "Username")
        UserDefaults.standard.removeObject(forKey: "Email")
        UserDefaults.standard.removeObject(forKey: "Password")
        self.mode.wrappedValue.dismiss()
    }
    
    func callArticleApi(){
        self.model.fetchArticle(period: 7)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
