//
//  MovieView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 27/03/2023.
//

import SwiftUI

struct MovieView: View {
    let movieId : Int

   @ObservedObject var data = MovieDetailState() 
    
    var body: some View {
        ZStack
        {
            LoadingView(isLoading: self.data.isLoading, error: self.data.error){
                self.data.loadMovie(id: self.movieId)
            }
            if data.movie != nil {
                MovieViewListView(movie: self.data.movie!)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationBarTitle(data.movie?.title ?? "")
        .onAppear{
            self.data.loadMovie(id: self.movieId)
        }
        
    }
}

struct MovieViewListView : View {
    let movie: Movie
    @State private var selectedTrailer : MovieVideos?
    
    var body: some View{
        List {
            MovieViewDetailImage(imageUrl: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            HStack(spacing: 10){
                Text(movie.genresText).font(.headline)
                Text(".")
                Text(movie.yearText).font(.body)
                Text(movie.durationText).font(.body)
              }
            
            Text(movie.overview ?? "")
                .font(.body)
            
            HStack{
                if !movie.ratingText.isEmpty{
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
               }
            
            
            if movie.youtubeTrailer != nil && movie.youtubeTrailer!.count > 0{
                Text("Trailer")
                    .font(.headline)
                ForEach(movie.youtubeTrailer!){
                    trailer in
                    Button(action: {self.selectedTrailer = trailer}){
                        HStack{
                            Text(trailer.name ?? "")
                            Spacer()
                            Image(systemName: "play_circle_fill")
                                .foregroundColor(.blue)
                        }
                    }

                }
                .sheet(item: self.$selectedTrailer){
                    trailer in
                    SafariView(url: trailer.youtubeURL!)
                }
            }
            
        }
    }
    
}

struct MovieViewDetailImage : View{
    
    @ObservedObject var imageLoader = ImageLoader()
    let imageUrl : URL
    
    var body: some View{
        ZStack{
            Rectangle()
                .fill(.gray.opacity(0.6))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear{
            self.imageLoader.loadImage(with: self.imageUrl)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MovieView(movieId: Movie.stubbedMovie.id ?? 0)
        }
    }
}
