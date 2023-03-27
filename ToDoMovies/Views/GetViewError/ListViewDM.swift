//
//  ListViewDM.swift
//  ToDoMovies
//
//  Created by RTS Mini on 27/03/2023.
//

import SwiftUI
struct ListViewDM: View {
    @ObservedObject  var nowPlayingState = MovieListState()
    @ObservedObject  var upcomingState = MovieListState()
    @ObservedObject var topRatedState = MovieListState()
      
       
       var body: some View {
           NavigationView {
               List {
                       if nowPlayingState.movies != nil {
                           MoviePosterCarouseView(title: "Now Playing", movie: nowPlayingState.movies ?? [])
                       } else {
                           LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                               self.nowPlayingState.loadMovies(with: .nowPlaying)
                           }
                    }
                                     
                       if upcomingState.movies != nil {
                           MovieCarouseView(title: "Upcoming", movies: upcomingState.movies ?? [])
                       } else {
                           LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                               self.upcomingState.loadMovies(with: .upcoming)
                           }
                       
                   }
                  
                       if topRatedState.movies != nil {
                           MovieCarouseView(title: "Top Rated", movies: topRatedState.movies ?? [])
                           
                       } else {
                           LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                               self.topRatedState.loadMovies(with: .topRate)
                           }
                   } // loi ni em nghi do service em viet sai, em sua dc link tai 1 anh roi con cai ni em chua sua duoc a
                
                   
               }
               .navigationBarTitle("The MovieDb")
           }
           .onAppear {
               self.nowPlayingState.loadMovies(with: .nowPlaying)
               self.upcomingState.loadMovies(with: .upcoming)
               self.topRatedState.loadMovies(with: .topRate)
           }
           
       }
   
}

struct ListViewDM_Previews: PreviewProvider {
    static var previews: some View {
        ListViewDM()
    }
}
