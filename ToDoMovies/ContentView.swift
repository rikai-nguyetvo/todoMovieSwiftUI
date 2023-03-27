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
          case movelist
      }
    var body: some View {
        TabView(selection: $selection) {
            MovieListView(movies: movies)
                .tabItem(){
                    Label("Home", systemImage: "star")
                }
                       .tag(Tab.home)

            MovieView(movieId: movies.first?.id ?? 0)
                .tabItem(){
                    Label("List", systemImage: "list.bullet")
                }
                       .tag(Tab.movelist)
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movies: Movie.stubbedMovies.results!)
    }
}
