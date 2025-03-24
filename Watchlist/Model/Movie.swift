//
//  Movie.swift
//  Watchlist
//
//  Created by Eric on 24/03/2025.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre

    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}
