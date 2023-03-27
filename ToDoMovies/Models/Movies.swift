//
//  Movies.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import Foundation

struct MovieReponsive : Codable {
//    let results : [Movie]
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
    let genres: [MovieGenres]?
    let runtime: Int?
    let credits: MovieCreadit?
    
    
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
        case genres
        case runtime
        case credits
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
    
    var cast : [MovieCast]? {
        credits?.cast
    }
    
    var crew :  [MovieCrew]?{
        credits?.crew
    }
    var director : [MovieCrew]?{
        crew?.filter { $0.job?.lowercased() == "director"}
        
    }
    var producers: [MovieCrew]? {
            crew?.filter { $0.job?.lowercased() == "producer" }
        }
    var screenWriters: [MovieCrew]? {
            crew?.filter { $0.job?.lowercased() == "story" }
        }
        
    }
    
    
    struct MovieGenres : Codable {
        let name : String?
    }
    
    struct MovieCreadit: Codable {
        let cast : [MovieCast]
        let crew : [MovieCrew]
    }
    
    struct MovieCast: Codable, Identifiable {
        let id: Int?
        let character : String?
        let name: String?
    }
    
    struct MovieCrew : Codable, Identifiable {
        let id: Int?
        let job : String?
        let name: String?
    }
