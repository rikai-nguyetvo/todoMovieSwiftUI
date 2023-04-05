//
//  Auth.swift
//  ToDoMovies
//
//  Created by RTS Mini on 05/04/2023.
//

import SwiftUI

struct Auththen: View {
    
    @State private var currentViewShowing: String = "login" // login or signup
    var body: some View {
        if(currentViewShowing == "login") {
            LogView(movies: Movie.stubbedMovies.results ?? [], currentShowingView: $currentViewShowing)
                        .preferredColorScheme(.light)
                } else {
                    LoginRegister(currentShowingView: $currentViewShowing)
                        .preferredColorScheme(.dark)
                        .transition(.move(edge: .bottom))
                }
    }
}

struct Auththen_Previews: PreviewProvider {
    static var previews: some View {
        Auththen()
    }
}
