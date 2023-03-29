//
//  ServiceDM.swift
//  ToDoMovies
//
//  Created by RTS Mini on 27/03/2023.
//

import SwiftUI


class MovieServices {

    let key = "e9e9d8da18ae29fc430845952232787c"
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieReponsive, Error>) -> Void){
        let urlString = "https://api.themoviedb.org/3/movie/\(endpoint)?api_key=\(key)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let movie = try JSONDecoder().decode(MovieReponsive.self, from: data)
                completion(.success(movie))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(key)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                completion(.success(movie))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func searchMovies(query: String, completion: @escaping (Result<MovieReponsive, Error>) -> Void){
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=\(key)&query=\(query)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let movie = try JSONDecoder().decode(MovieReponsive.self, from: data)
                completion(.success(movie))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
//    func fetchCredits(id: Int,completion: @escaping (Result<Movie, Error>) -> Void)
//    {
//       let urlString = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=\(key)"
//        guard let url = URL(string: urlString) else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
//                return
//            }
//
//            do {
//                let movie = try JSONDecoder().decode(Movie.self, from: data)
//                completion(.success(movie))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
}

