//
//  MoviesModel.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import Foundation
import Combine

final class MoviesModel: ObservableObject{
    
  @Published var landmarks: [Movie] = load("movie_list.json")
    
}


func load<T: Decodable>(
    _ filename: String)-> T{
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do{
            data = try Data(contentsOf: file)
        }catch{
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        
        do{
           let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }catch{
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    
    }