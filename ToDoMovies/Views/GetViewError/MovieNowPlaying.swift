//
//  MovieNowPlaying.swift
//  ToDoMovies
//
//  Created by RTS Mini on 27/03/2023.
//

import SwiftUI

struct MovieNowPlaying: View {
    @State var movies = [Movie]()
    
        func loadData() {
            guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e9e9d8da18ae29fc430845952232787c") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([Movie].self, from: data)
                    DispatchQueue.main.async {
                        self.movies = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }

        var body: some View {
            List(movies, id: \.title) { movie in
                HStack {
                    if let posterPath = movie.posterPath {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w92\(posterPath)")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 92, height: 138)
                        .cornerRadius(8)
                    } else {
                        Image(systemName: "film")
                            .resizable()
                            .frame(width: 92, height: 138)
                            .cornerRadius(8)
                    }
                    VStack(alignment: .leading) {
                        Text(movie.title ?? "")
                            .font(.headline)
                        Text(movie.overview ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Top Rated Movies")
        }
}

struct MovieNowPlaying_Previews: PreviewProvider {
    static var previews: some View {
        MovieNowPlaying()
    }
}
