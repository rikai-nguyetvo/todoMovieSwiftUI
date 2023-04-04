//
//  LoadingView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 24/03/2023.
//

import SwiftUI

struct LoadingView: View {
    let isLoading : Bool
    let error : NSError?
    let retryAction: (() -> ())?
    
    var body: some View {
        Group {
            if isLoading {
                HStack{
                    Spacer()
                    ActivitIndicationView()
                    Spacer()
                }
            } else if error != nil {
                HStack{
                    Spacer()
                    VStack(spacing: 4){
                        Text(error!.localizedDescription)
                            .font(.headline)
                        
                        if self.retryAction != nil {
                            Button(action: self.retryAction!){
                                Text("Restry")
                            }
                            .foregroundColor(.gray)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true ,error: nil, retryAction: nil)
    }
}
