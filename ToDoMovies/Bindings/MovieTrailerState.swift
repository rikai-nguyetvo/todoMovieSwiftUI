//
//  MovieTrailerState.swift
//  ToDoMovies
//
//  Created by RTS Mini on 31/03/2023.
//

import Foundation


class MovieTrailerState : ObservableObject{
    
    private let movieService: MovieServices
    @Published var movie: [MovieVideos]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    init(movieService: MovieServices = MovieServices()) {
        self.movieService = movieService
    }
     
    func loadMovie(id: Int){
        self.movie = nil
        self.isLoading = true
        self.error = nil
        
        self.movieService.fetchMovieTrailers(id: id){
            [weak self] (result) in
            guard let self = self else{
                return
            }
            self.isLoading = false
            
            switch result {
            case .success(let reponsive):
                self.movie = reponsive.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
