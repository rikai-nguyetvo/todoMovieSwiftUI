//
//  ImageLoader.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import Foundation
import Combine

class ImageLoaders: ObservableObject {
    var dataPublisher = PassthroughSubject<Data, Never>()
    var data = Data(){
        didSet {
                    dataPublisher.send(data)
                }
    }
    init(urlString: String){
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url){
            data, reponsive, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.sync{
                self.data = data
            }
        }
        task.resume()
    }
}
