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
          case movelist
      }
    var body: some View {
        TabView(selection: $selection) {
            ListViewDM()
                .tabItem(){
                    Label("Home", systemImage: "list.bullet")
                }
                       .tag(Tab.home)
            
            MovieListView(movies: movies)
                .tabItem(){
                    Label("Watch", systemImage: "tv")
                }
                       .tag(Tab.movelist)

            MovieSearchView()
                .tabItem(){
                    Label("Detail", systemImage: "star")
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
