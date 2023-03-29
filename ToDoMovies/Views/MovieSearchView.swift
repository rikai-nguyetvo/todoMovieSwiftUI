//
//  MovieSearchView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 28/03/2023.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var searchMovie = SearchBarState()
    
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
                            VStack(alignment: .leading){
                                Text(movie.title ?? "")
                                Text(movie.yearText)
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

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
