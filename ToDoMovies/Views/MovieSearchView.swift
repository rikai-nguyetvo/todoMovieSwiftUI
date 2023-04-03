//
//  MovieSearchView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 28/03/2023.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var searchMovie = SearchBarState()
    let movie : Movie
    
    var body: some View {
        NavigationView {
            List {
                SearchBarView(placeholder: "Search Movie", text: self.$searchMovie.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                LoadingView(isLoading: self.searchMovie.isLoading, error: self.searchMovie.error){
                    self.searchMovie.search(query: self.searchMovie.query)
                }
                if self.searchMovie.movies != nil {
                    ForEach(self.searchMovie.movies!){
                        movie in
                        NavigationLink(destination: MovieView(movieId: movie.id!)){
                            
                            HStack(alignment: .top, spacing: 5) {
                                MovieViewSearchImage(imageUrl: movie.posterURL)
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                VStack(alignment: .leading){
                                    Text(movie.title ?? "")
                                    Text(movie.ratingText).foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                }
                    
            }
            .onAppear{
                self.searchMovie.startObserve()
            }
            .navigationTitle("Search")
        }
        
    }
}
struct MovieViewSearchImage : View{
    
    @ObservedObject var imageLoader = ImageLoader()
    let imageUrl : URL
    
    var body: some View{
        ZStack{
            
                Rectangle()
                    .fill(.gray.opacity(0.6))
                    .frame(width: 70, height: 50)
            
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .frame(width: 70, height: 50)
            }
        }
        .aspectRatio(12/9, contentMode: .fit)
        .onAppear{
            self.imageLoader.loadImage(with: self.imageUrl)
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView(movie: Movie.stubbedMovie)
    }
}
