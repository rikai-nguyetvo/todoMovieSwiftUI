//
//  ImageView.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import SwiftUI
import Combine

struct ImageView: View {
    @ObservedObject var imageLoader : ImageLoaders
    @State var image:UIImage = UIImage()
    init(withURL url: String) {
        imageLoader = ImageLoaders(urlString: url)
    }
    var body: some View {
        VStack {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100, height:100)
            }.onReceive(imageLoader.dataPublisher) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
