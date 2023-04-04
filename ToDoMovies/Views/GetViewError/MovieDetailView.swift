//
//  MovieView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 27/03/2023.
//

import SwiftUI
import SafariServices

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
    @ObservedObject var watchTL  = MovieTrailerState()
    @State private var selectedTrailer : Videos?
    
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
            
           
            HStack(alignment: .top, spacing: 4) {
                           if movie.cast != nil && movie.cast!.count > 0 {
                               VStack(alignment: .leading, spacing: 4) {
                                   Text("Starring").font(.headline)
                                   ForEach(self.movie.cast!.prefix(9)) { cast in
                                       Text(cast.name)
                                   }
                               }
                               .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                               Spacer()
                               
                           }
                           
                           if movie.crew != nil && movie.crew!.count > 0 {
                               VStack(alignment: .leading, spacing: 4) {
                                   if movie.directors != nil && movie.directors!.count > 0 {
                                       Text("Director(s)").font(.headline)
                                       ForEach(self.movie.directors!.prefix(2)) { crew in
                                           Text(crew.name)
                                       }
                                   }
                                   
                                   if movie.producers != nil && movie.producers!.count > 0 {
                                       Text("Producer(s)").font(.headline)
                                           .padding(.top)
                                       ForEach(self.movie.producers!.prefix(2)) { crew in
                                           Text(crew.name)
                                       }
                                   }
                                   
                                   if movie.screenWriters != nil && movie.screenWriters!.count > 0 {
                                       Text("Screenwriter(s)").font(.headline)
                                           .padding(.top)
                                       ForEach(self.movie.screenWriters!.prefix(2)) { crew in
                                           Text(crew.name)
                                       }
                                   }
                               }
                               .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                           }
                       }
            
             Button("Watch Trailer") {
                let youtubeURL = URL(string: "https://www.youtube.com/watch?v=vOUVVDWdXbo")!
                let safariViewController = SFSafariViewController(url: movie.videoTrailer)
                UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
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
