//
//  MovieItems.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import SwiftUI

struct MovieItems: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        
        VStack(alignment: .leading){
            ZStack{
                Rectangle()
                    .fill(.gray.opacity(0.6))
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 6)
           
            Text(movie.title ?? "")
                
        }
        .lineLimit(1)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)

        }
        
    }
    
        
}

struct MovieItems_Previews: PreviewProvider {
    static var previews: some View {
        MovieItems(movie: Movie.stubbedMovie)
    }
}
