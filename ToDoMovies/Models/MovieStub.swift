import Foundation


extension Movie {

    static var stubbedMovies: ListResponse<Movie> {
        return load("movie_list.json")
    }

    static var stubbedMovie: Movie {
//        return Movie(id: 338762, title: "Bloodshot", backdropPath: "/ocUrMYbdjknu2TwzMHKT9PBBQRw.jpg", posterPath: "", overview: "ffffdfbdz", voteAverage: 0, voteAcount: 0, runTime: 0)
        return stubbedMovies.results!.first!
    }

}


