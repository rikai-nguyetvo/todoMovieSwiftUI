//
//  ToDoMoviesApp.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import SwiftUI
import Firebase

@main
struct ToDoMoviesApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
