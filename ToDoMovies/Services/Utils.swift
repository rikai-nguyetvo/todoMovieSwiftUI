//
//  Utils.swift
//  ToDoMovies
//
//  Created by RTS Mini on 21/03/2023.
//

import Foundation

class Utils {
    static let jsonDecode: JSONDecoder = {
          let jsonDecoder = JSONDecoder()
          jsonDecode.keyDecodingStrategy = .convertFromSnakeCase
          jsonDecode.dateDecodingStrategy = .formatted(dateFormat)
          return jsonDecode
      }()
    
    static let dateFormat : DateFormatter = {
       let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-mm-dd"
        return dateFormater
    }()
}
