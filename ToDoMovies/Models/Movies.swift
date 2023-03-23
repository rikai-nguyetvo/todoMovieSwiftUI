//
//  Movies.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import Foundation

struct MovieReponsive: Decodable {

    let result : [Movie]
}

struct Movie : Decodable, Identifiable {
    
    let id : Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage : Double?
    let voteAcount : Int
    let runTime: Int?
    
    var backdropURL: URL {
            return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
        }
}
