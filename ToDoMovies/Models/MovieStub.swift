import Foundation


extension Movie {

    static var stubbedMovies: [Movie] {
        let response: MovieReponsive? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.result
    }

    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }

}

extension Bundle {

    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecode
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}
