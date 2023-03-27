//
//  ListResponse.swift
//  ToDoMovies
//
//  Created by RTS Mini on 23/03/2023.
//

import Foundation

struct ListResponse<T: Codable>: Codable {
    let results: [Movie]?
    let page, totalResults: Int?
    let totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
