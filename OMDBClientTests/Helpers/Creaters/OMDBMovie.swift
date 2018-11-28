//
//  OMDBMovie.swift
//  OMDB-ClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

import Foundation
@testable import OMDBClient

extension OMDBMovie {
    static func createOMDBMovieModal() -> OMDBMovie {
        return OMDBMovie(poster: "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg", title: "Batman Begins", type: "movie", year: "2016", imdbID: "tt0372784")
    }
}
