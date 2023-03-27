//
//  MovieService.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import Foundation

protocol MovieService{
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieReponsive, MovieError>) -> ())
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping (Result<MovieReponsive, MovieError>) -> () )
    
}

enum MovieListEndpoint: String, CaseIterable{
    case nowPlaying = "now_playing"
    case upcoming
    case topRate = "top_rated"
    
    var description : String {
        switch self{
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "UpComing"
        case .topRate: return "Top Rate"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidReponsive
    case noData
    case serializationError
    
    var localDescription: String{
        switch self{
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint : return "Invalid Endpoint"
        case .invalidReponsive: return "Invalid reponsive"
        case .noData : return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    var errorUserInfor : [String: Any] {
        [NSLocalizedDescriptionKey: localDescription]
    }
}

