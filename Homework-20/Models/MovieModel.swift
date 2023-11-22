//
//  Models.swift
//  Homework-20
//
//  Created by salome on 21.11.23.
//

import Foundation

// MARK: - Welcome
struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
   
   
    let id: Int
    let title: String
    let posterPath: String
    

    enum CodingKeys: String, CodingKey {
   
        case id
        case title
        case posterPath = "poster_path"
        
    }
}
