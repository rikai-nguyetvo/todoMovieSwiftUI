//
//  MovieListView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import SwiftUI

struct MovieListView: View {
   
    let movies : [Movie]
    
    var body: some View {
        NavigationView{
            
            List{
                MoviePosterCarouseView(title: "Now Playing", movie: movies)

                MovieCarouseView(title: "Up Coming", movies: movies)

                MovieCarouseView(title: "Top Rate", movies: movies)
                
            }
                .navigationTitle("ToDo Movies")
                .toolbar{
                    Button{
                    } label: {
                        Label("User", systemImage: "person.crop.circle")
                    }
                }
            }
            
        }
    }


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: Movie.stubbedMovies.results ?? [])
            
    }
}
