//
//  MovieBackDropView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import SwiftUI

struct MoviePosterView: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        VStack(alignment: .leading){
            if self.imageLoader.image != nil{
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 6)
            }
            else{
                Rectangle()
                    .fill(.gray.opacity(0.6))
                    .cornerRadius(8)
                    .shadow(radius: 6)
            }
        }
        .frame(width: 204, height: 326)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.posterURL)

        }
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterView(movie: Movie.stubbedMovie)
    }
}
