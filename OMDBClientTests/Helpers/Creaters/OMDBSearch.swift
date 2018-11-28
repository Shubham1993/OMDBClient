//
//  OMDBSearch.swift
//  OMDB-ClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

import Foundation
@testable import OMDBClient

extension OMDBSearch {
    static func createOMDBSearchModal() -> OMDBSearch {
        return OMDBSearch.init(response: "True", search: [OMDBMovie.createOMDBMovieModal(), OMDBMovie.createOMDBMovieModal()], totalResults: "347")
    }
}
