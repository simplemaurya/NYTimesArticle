//
//  RegisterView.swift
//  LoginSignupPractice
//
//  Created by AAPNA on 15/06/20.
//  Copyright © 2020 AAPNA. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State var username : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var fromFirstView : Int?
    @State var alertText : String = ""
    @State var showingAlert : Bool = false
    @State var navigate : Bool = false
    
    var body: some View {
      NavigationView{
        VStack {
        //Spacer()
        Text("The New York Times").font(.title).fontWeight(.medium)
        .font(.custom("Abadi MT Condensed Light", size: 8))
         .padding(.top,-100)
         .foregroundColor(lightBlueColor)
        
        //Spacer()
        VStack(alignment: .leading){
        Text("Username")
        .font(.subheadline)
        .fontWeight(.medium)
        TextField("Username", text: $username)
        .accentColor(lightBlueColor)
        .padding()
        .background(textFieldBGColor)
        .cornerRadius(4.0)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
        }.padding(.top,-30)
        
        VStack(alignment: .leading){
        Text("Email id")
        .font(.subheadline)
        .fontWeight(.medium)
        TextField("Email", text: $email)
        .accentColor(lightBlueColor)
        .padding()
        .background(textFieldBGColor)
        .cornerRadius(4.0)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
        }
        
        VStack(alignment: .leading){
        Text("Password")
        .font(.subheadline)
        .fontWeight(.medium)
        //.frame(width: 50, alignment: .leading)
        SecureField("Password", text: self.$password)
        .accentColor(lightBlueColor)
        .padding()
        .background(textFieldBGColor)
        .cornerRadius(4.0)
        }
        
        NavigationLink(destination: ArticleView(username: self.$username,email: self.$email, password : self.$password), isActive: $navigate) {
        Button(action: {self.validate()}) {
            HStack(alignment: .center) {
                Spacer()
                Text("Login")
                .foregroundColor(Color.white).bold()
                Spacer()
            }

        }.padding()
        .background( LinearGradient(gradient: Gradient(colors: [lightBlueColor, darkBlueColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(4.0)
        .padding(.top,20)
       }
        
       // Spacer()
        
   }
    .padding(EdgeInsets(top:15, leading: 15, bottom:0, trailing: 15))
    .alert(isPresented: $showingAlert) {
        Alert(title: Text("Alert"), message: Text(self.alertText), dismissButton: .default(Text("OK")))
        }
      }
     .onAppear(){
        UINavigationBar.appearance().barTintColor = barTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
      }
        .accentColor(.white)
    }
    
    func validate(){
        let validE = validEmail(email: self.email)
        if self.email.isEmpty || self.username.isEmpty || self.password.isEmpty{
            self.showingAlert = true
            self.alertText = emptyFieldTxt
            return
        }
        if (!validE){
            self.showingAlert = true
            self.alertText = emailTxt
            return
        }else{
            self.navigate = true
            UserDefaults.standard.set(username, forKey: "Username")
            UserDefaults.standard.set(email, forKey: "Email")
            UserDefaults.standard.set(password, forKey: "Password")
            UserDefaults.standard.synchronize()
        }
    }
    
    func validEmail(email:String) -> Bool{
        let emailRegex = "[0-9A-Za-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validEmail.evaluate(with: email)
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
