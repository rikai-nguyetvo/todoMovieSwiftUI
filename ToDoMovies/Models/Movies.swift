//
//  Movies.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import Foundation

struct MovieReponsive: Decodable {
    let results : [Movie]
}

struct Movie : Hashable, Codable, Identifiable  {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalTitle: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
    
    var posterURL: URL{
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
}
