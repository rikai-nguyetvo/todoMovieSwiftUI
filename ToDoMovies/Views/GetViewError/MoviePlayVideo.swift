//
//  MoviePlayVideo.swift
//  ToDoMovies
//
//  Created by RTS Mini on 30/03/2023.
//

import SwiftUI
import SafariServices

struct MoviePlayVideo: View {
    var movie: Movie
    @ObservedObject var trailerViewModel = TrailerViewModel(movieID: Movie.stubbedMovie.id ?? 0 )
    var body: some View {
        Group {
            if trailerViewModel.videoKey != nil {
                Button("Watch Trailer") {
                    guard let videoKey = trailerViewModel.videoKey else { return }
                    let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(videoKey)")!
                    let safariViewController = SFSafariViewController(url: youtubeURL)
                    UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
                }
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            trailerViewModel.getMovieTrailer()
        }

    }
}

struct MoviePlayVideo_Previews: PreviewProvider {
    static var previews: some View {
        MoviePlayVideo(movie: Movie.stubbedMovie)
    }
}
