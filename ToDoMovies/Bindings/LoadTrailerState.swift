//
//  LoadTrailerState.swift
//  ToDoMovies
//
//  Created by RTS Mini on 30/03/2023.
//

import Foundation

class LoadTrailerState : ObservableObject {
    private let movieService: MovieServices
    @Published var movie: Movie?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    init(movieService: MovieServices = MovieServices()){
        self.movieService = movieService
    }
}
