//
//  SearchBarState.swift
//  ToDoMovies
//
//  Created by RTS Mini on 29/03/2023.
//

import Foundation
import SwiftUI
import Combine

class SearchBarState : ObservableObject{
    @Published var query = ""
    @Published var movies : [Movie]?
    @Published var isLoading = false
    @Published var error : NSError?
    
    private var subcriptionToken: AnyCancellable?
    let movieService : MovieServices
    
    init(movieService: MovieServices = MovieServices()) {
        self.movieService = movieService
    }
             
    func startObserve() {
            guard subcriptionToken == nil else { return }
            
            self.subcriptionToken = self.$query
                .map { [weak self] text in
                    self?.movies = nil
                    self?.error = nil
                    return text
                    
            }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink {
                [weak self] in self?.search(query: $0)
            }
                
        }
    
    func search(query: String){
        self.movies = nil
        self.error = nil
        self.isLoading = false
        
        guard !query.isEmpty else {return}
        self.isLoading = true
        self.movieService.searchMovies(query: query){
            [weak self] (result) in
            guard let self = self, self.query == query else { return
            }
            self.isLoading = false
            switch result {
            case.success(let reponsive):
                self.movies = reponsive.results
            case.failure(let error):
                self.error = error as NSError
            }
        }
    }
    deinit {
            self.subcriptionToken?.cancel()
            self.subcriptionToken = nil
        }
}
