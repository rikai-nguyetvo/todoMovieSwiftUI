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
    
  //  @UIApplicationDelegateAdaptor
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegateAdaptor{
//    func application(_ application: UIApplication, didFinishLaunchingWithOption launchOption : [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//
//        return true
//    }
//}
