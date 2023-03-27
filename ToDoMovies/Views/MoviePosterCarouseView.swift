//
//  MoviePosterCarouseView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import SwiftUI

struct MoviePosterCarouseView: View {
    
    let title: String
    
    let movie : [Movie]
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 16){
                    ForEach(self.movie) { movie in
                        
                        NavigationLink(destination: MovieView(movieId: movie.id!)){
                            MoviePosterView(movie: movie)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movie.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movie.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MoviePosterCarouseView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouseView(title: "Now Playing",movie: Movie.stubbedMovies.results ?? [])
    }
}
