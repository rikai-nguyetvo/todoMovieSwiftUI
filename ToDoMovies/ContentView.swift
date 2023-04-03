//
//  ContentView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    let movies : [Movie]
    @State private var selection: Tab = .home
    enum Tab {
          case home
          case detail

      }
    var body: some View {
        TabView(selection: $selection) {
            ListViewDM()
                .tabItem(){
                    Label("Home", systemImage: "list.bullet")
                }
                       .tag(Tab.home)
            
        

            MovieSearchView(movie: Movie.stubbedMovie)
                .tabItem(){
                    Label("Search", systemImage: "magnifyingglass")
                }
                       .tag(Tab.detail)
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movies: Movie.stubbedMovies.results!)
    }
}
