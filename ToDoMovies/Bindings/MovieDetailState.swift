//
//  MovieDetailState.swift
//  ToDoMovies
//
//  Created by RTS Mini on 24/03/2023.
//

import SwiftUI

class MovieDetailState : ObservableObject{
    private let movieService: MovieServices
    @Published var movie: Movie?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    init(movieService: MovieServices = MovieServices()) {
        self.movieService = movieService
    }
     
    func loadMovie(id: Int){
        self.movie = nil
        self.isLoading = true
        self.error = nil
        
        self.movieService.fetchMovie(id: id){
            [weak self] (result) in
            guard let self = self else{
                return
            }
            self.isLoading = false
            
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}



