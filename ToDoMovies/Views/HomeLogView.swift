//
//  HomeLogView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 05/04/2023.
//

import SwiftUI
import Firebase

struct HomeLogView: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
        if userID == "" {
                    Auththen()
                } else {
                    HomeScreen(movies: Movie.stubbedMovies.results ?? [])
//                    Text("Logged In! \nYour user id is \(userID)")
//
//                    Button(action: {
//                        let firebaseAuth = Auth.auth()
//                        do {
//                            try firebaseAuth.signOut()
//                            withAnimation {
//                                userID = ""
//                            }
//                        } catch let signOutError as NSError {
//                            print("Error signing out: %@", signOutError)
//                        }
//                    }) {
//                        Text("Sign Out")
//                    }
                }
    }
}

struct HomeLogView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLogView()
    }
}
