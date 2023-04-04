//
//  LoginView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 04/04/2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var userIsLoggedIn = false
    let movies : [Movie]
         
    var body: some View {
        NavigationView{
            ZStack{
                Color.mint.opacity(0.6)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.6)
                    .foregroundColor(.white.opacity(0.6))
                Circle()
                    .scale(1.2)
                    .foregroundColor(.white.opacity(0.8))
                VStack{
                    Text("Login").font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("UserName", text:$username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.1))
                        .cornerRadius(8)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text:$password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.black.opacity(0.1))
                        .cornerRadius(8)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button{
                        register()
                      
                    }label: {
                        Text("Sign").font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.mint.opacity(0.7))
                    .cornerRadius(8)
                    
                    Button{
                       // login()
                        authenUser(username: username, password: password)
                    }label: {
                        Text("Already have an acount? Login").font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.mint.opacity(0.7))
                    .cornerRadius(8)
                    .offset(y: 110)
                    
                    
                    NavigationLink(destination: HomeScreen(movies: movies), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                }
                .onAppear{
                    Auth.auth().addStateDidChangeListener{
                        auth, user in
                        if user != nil{
                            userIsLoggedIn.toggle()
                        }
                    }
                }
                .ignoresSafeArea()
                .navigationBarHidden(true)
            }
            
        }
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: username, password: password){
            result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: username, password: password){
            result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
    func authenUser(username: String, password: String){
        if username.lowercased() == "minhnguyet123"
        {
            wrongUsername = 0
            if password.lowercased() == "123"
            {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        }else {
            wrongUsername = 2
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(movies: Movie.stubbedMovies.results ?? [])
    }
}
