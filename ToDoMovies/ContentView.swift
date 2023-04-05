//
//  ContentView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
       // LoginView(movies: Movie.stubbedMovies.results ?? [])
        HomeLogView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
