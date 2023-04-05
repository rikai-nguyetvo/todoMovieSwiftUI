//
//  InforView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 04/04/2023.
//

import SwiftUI
import Firebase

struct InforView: View {
    @AppStorage("uid") var userID: String = ""
    @AppStorage("name") var email: String = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.mint.opacity(0.6)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.6)
                    .foregroundColor(.white.opacity(0.6))
                VStack{
                    Text("Infomation User")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Text("Username: Minh Nguyet")
                        .padding()
                    
                    Button(action: {
                        let firebaseAuth = Auth.auth()
                        do {
                            try firebaseAuth.signOut()
                            withAnimation {
                                userID = ""
                            }
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                    }) {
                        Text("Sign Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(.mint)
                            .cornerRadius(10)
                            .shadow(radius: 6)
                    }
                    
                    
                }
            }
        }
    }
}

struct InforView_Previews: PreviewProvider {
    static var previews: some View {
        InforView()
    }
}
