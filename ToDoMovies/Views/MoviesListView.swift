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
                   Group{
                       if nowPlayingState.movies != nil {
                           MoviePosterCarouseView(title: "Now Playing", movie: nowPlayingState.movies ?? [])
                       } else {
                           LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                               self.nowPlayingState.loadMovies(with: .now_playing)
                           }
                       }
                   }
                   .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                   Group {
                   if upcomingState.movies != nil {
                       MovieCarouseView(title: "Upcoming", movies: upcomingState.movies ?? [])
                   } else {
                       LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                           self.upcomingState.loadMovies(with: .upcoming)
                       }
                       
                   }
               }
                   .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                   Group {
                       if topRatedState.movies != nil {
                           MovieCarouseView(title: "Top Rated", movies: topRatedState.movies ?? [])
                           
                       } else {
                           LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                               self.topRatedState.loadMovies(with: .top_rated)
                           }
                       }
                   }
                   .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                   
               }
               .navigationBarTitle("The MovieDb")
               .toolbar{
                   Button{
                   } label: {
                       Label("User", systemImage: "person.crop.circle")
                   }
               }
           }
           .onAppear {
               self.nowPlayingState.loadMovies(with: .now_playing)
               self.upcomingState.loadMovies(with: .upcoming)
               self.topRatedState.loadMovies(with: .top_rated)
           }
           
       }
   
}

struct ListViewDM_Previews: PreviewProvider {
    static var previews: some View {
        ListViewDM()
    }
}
