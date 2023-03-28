//
//  MovieListState.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import SwiftUI
import Combine

class MovieListState : ObservableObject {
    @Published var movies : [Movie]?
    @Published var isLoading : Bool = false
    @Published var error: NSError?
    
    
    private let movieService: MovieServices
    
    init(movieService: MovieServices = MovieServices()) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint){
        self.movies = nil
        self.isLoading = false
        self.movieService.fetchMovies(from: endpoint){
            [weak self] (result) in
            guard let self = self else{
                return
            }
            self.isLoading = false
            
            switch result {
            case.success(let reponse):
                self.movies = reponse.results
            case.failure(let error):
                self.error = error as NSError
            }
            
        }
        
    }
}

