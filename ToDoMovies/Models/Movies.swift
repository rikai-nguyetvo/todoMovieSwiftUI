//
//  Movies.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import Foundation

struct MovieReponsive : Codable {
    let results: [Movie]
    let page, totalResults: Int
        

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
           
        }
}

struct Movie :  Codable, Identifiable  {
    
    let popularity: Double?
    let voteCount: Int?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalTitle: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview, releaseDate: String?
    let genres: [MovieGenres]?
    let runtime: Int?
    let credits: MovieCreadit?
    let videos: MovieVideoReponsives?
    
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case genres
        case runtime
        case credits
        case videos
    }
    
    static private let yearFormater : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static private let durationFormat: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
        
    }()
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
    
    var posterURL: URL{
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var genresText: String {
        return genres?.first?.name ?? ""
    }
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce(""){
            (acc, _ ) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String
    {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    
    var yearText : String {
        guard let releaseDate = self.releaseDate, let date = Utils.dateFormat.date(from: releaseDate) else{
            return "n/a"
        }
        return Movie.yearFormater.string(from: date)
    }
    
    var durationText : String {
        guard let runtime = self.runtime, runtime > 0 else{
            return "n/a"
        }
        return Movie.durationFormat.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
    var trailer :URL {
        let keyId = videos?.results.first?.key
        return URL(string: "https://www.youtube.com/watch?v=\(keyId)")!
    }
    
//    var youtubeTrailer : [MovieVideos]? {
//        return  videos?.results.filter{
//            $0.youtubeURL != nil
//        }
//    }
    
}

    
    struct MovieGenres : Codable {
        let name : String?
    }
    
    struct MovieCreadit: Codable {
        let cast : [MovieCast]
        let crew : [MovieCrew]
    }
    
    struct MovieCast: Codable, Identifiable {
        let character : String
        let id: Int
        let name: String
    }
    
    struct MovieCrew : Codable, Identifiable {
        let id : Int
        let name: String
        let job: String
    }

struct MovieVideoReponsives: Codable {
    let results: [MovieVideos]
}

struct MovieVideos: Codable, Identifiable {
    let id: String
    let key : String?
    let name, site: String?
    let size: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id
        case key
        case name
        case site
        case size, type
    }
    var youtubeURL: URL? {
        return URL(string: "https://www.youtube.com/watch?v=\(key)")!
    }
}
