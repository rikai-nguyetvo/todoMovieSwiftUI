//
//  InforView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 04/04/2023.
//

import SwiftUI

struct InforView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.mint.opacity(0.6)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.6)
                    .foregroundColor(.white.opacity(0.6))
                VStack{
                    Text("Infomation User")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                   
                    Text("Username: Minh Nguyet")
                    
                }
            }
        }
    }
}

struct InforView_Previews: PreviewProvider {
    static var previews: some View {
        InforView()
    }
}
