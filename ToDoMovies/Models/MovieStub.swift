import Foundation


extension Movie {

    static var stubbedMovies: ListResponse<Movie> {
        return load("movie_list.json")
    }

    static var stubbedMovie: Movie {
        return stubbedMovies.results!.first!
    }
    
    static var detailMovie: MovieReponsive {
        return load("movie_info.json")
    }
}


