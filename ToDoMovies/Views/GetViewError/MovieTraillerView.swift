//
//  MovieTraillerView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 30/03/2023.
//

import SwiftUI
import Combine

class TrailerViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var videoKey: String?
    var movieID: Int
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    func getMovieTrailer() {
        TMDBClient.getMovieTrailer(movieID: movieID)
            .map { $0.key }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.videoKey, on: self)
            .store(in: &cancellables)
    }
    
    func openTrailer() {
        guard let videoKey = videoKey else { return }
        let url = URL(string: "https://www.youtube.com/watch?v=\(videoKey)")!
        UIApplication.shared.open(url)
    }
}

struct TrailerView: View {
    @StateObject private var viewModel: TrailerViewModel
    
    init(movieID: Int) {
        _viewModel = StateObject(wrappedValue: TrailerViewModel(movieID: movieID))
    }
    
    var body: some View {
        Group {
            if let videoKey = viewModel.videoKey {
                Button(action: {
                    viewModel.openTrailer()
                }) {
                    Text("Watch Trailer")
                }
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.getMovieTrailer()
        }
    }
}

class TMDBClient {
    static let apiKey = "YOUR_API_KEY_HERE"
    
    enum Endpoints {
        static let base = "https://api.themoviedb.org/3"
        static let trailers = "/movie/%d/videos"
        
        case movieTrailers(Int)
        
        var stringValue: String {
            switch self {
            case .movieTrailers(let id):
                return Endpoints.base + String(format: Endpoints.trailers, id) + "?api_key=\(TMDBClient.apiKey)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func getMovieTrailer(movieID: Int) -> AnyPublisher<Trailer, Error> {
        let url = Endpoints.movieTrailers(movieID).url
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: TrailerResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .flatMap { trailers -> AnyPublisher<Trailer, Error> in
                if let trailer = trailers.first {
                    return Just(trailer)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: NSError(domain: "com.example", code: 0, userInfo: [NSLocalizedDescriptionKey: "No trailer found"]))
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

struct TrailerResponse: Codable {
    let results: [Trailer]
}

struct Trailer: Codable {
    let key: String
}
