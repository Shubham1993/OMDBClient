//
//  DetailViewSpy.swift
//  OMDBClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

@testable import OMDBClient

class DetailViewSpy: DetailView {
    
    var showMoviePosterToBeCalled = false
    var showMovieTitleToBeCalled = false
    var showMovieTypeToBeCalled = false
    var showMovieReleaseyearToBeCalled = false

    
    func showMoviePoster(withPosterUrl url: String) {
        showMoviePosterToBeCalled = true
    }
    
    func showMovieTitle(withTitle title: String) {
        showMovieTitleToBeCalled = true
    }
    
    func showMovieType(withType type: String) {
        showMovieTypeToBeCalled = true
    }
    
    func showMovieReleaseyear(withReleaseYear year: String) {
        showMovieReleaseyearToBeCalled = true
    }
}
