//
//  DetailModel.swift
//  ToDoMovies
//
//  Created by RTS Mini on 28/03/2023.
//

//import Foundation
//
//struct MovieDetail: Codable {
//    let adult: Bool
//    let backdropPath: String
//
//    let budget: Int
//    let genres: [Genre]
//    let homepage: String
//    let id: Int
//    let imdbID, originalLanguage, originalTitle, overview: String
//    let popularity: Int
//    let posterPath: String
//    let releaseDate: String
//    let runtime: Int
//    let status, tagline, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//    let videos: Videos
//    let credits: Credits
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case budget, genres, homepage, id
//        case imdbID = "imdb_id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case runtime
//        case status, tagline, title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//        case videos, credits
//    }
//}
//
//struct Credits: Codable {
//    let cast: [Cast]
//    let crew: [Crew]
//}
//
//struct Cast: Codable {
//    let castID: Int
//    let character, creditID: String
//    let gender, id: Int
//    let name: String
//    let order: Int
//    let profilePath: String?
//
//    enum CodingKeys: String, CodingKey {
//        case castID = "cast_id"
//        case character
//        case creditID = "credit_id"
//        case gender, id, name, order
//        case profilePath = "profile_path"
//    }
//}
//
//struct Crew: Codable {
//    let creditID, department: String
//    let gender, id: Int
//    let job, name: String
//    let profilePath: String?
//
//    enum CodingKeys: String, CodingKey {
//        case creditID = "credit_id"
//        case department, gender, id, job, name
//        case profilePath = "profile_path"
//    }
//}
//
//struct Genre: Codable {
//    let id: Int
//    let name: String
//}
//
//
//struct Videos: Codable {
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let id, iso639_1, iso3166_1, key: String
//    let name, site: String
//    let size: Int
//    let type: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case iso639_1 = "iso_639_1"
//        case iso3166_1 = "iso_3166_1"
//        case key, name, site, size, type
//    }
//}
