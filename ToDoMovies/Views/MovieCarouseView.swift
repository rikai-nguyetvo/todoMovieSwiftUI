//
//  MovieCarouseView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 22/03/2023.
//

import SwiftUI

struct MovieCarouseView: View {
    let movies: [Movie]
    let title: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 16){
                    ForEach (self.movies){
                        movie in
                        MovieItems(movie: movie)
                            .frame(width: 272, height: 200)
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MovieCarouseView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCarouseView(movies: Movie.stubbedMovies, title: "Lastet")
    }
}
