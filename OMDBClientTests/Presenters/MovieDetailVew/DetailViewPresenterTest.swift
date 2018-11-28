//
//  DetailViewPresenterTest.swift
//  OMDB-ClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import XCTest
@testable import OMDBClient

class DetailViewPresenterTest: XCTestCase {
    
    let detailViewRouterSpy = DetailViewRouterSpy()
    let detailViewSpy = DetailViewSpy()
    let apiClientSpy = APIRequestClientSpy()
    
    var detailViewPresenter: DetailViewPresenterImplementation!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        detailViewPresenter = DetailViewPresenterImplementation(view: detailViewSpy, router: detailViewRouterSpy)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        detailViewPresenter = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_success_display_movie_type() {
        //setup
        let movieDetail = OMDBMovie.createOMDBMovieModal()
        // When
        detailViewPresenter.viewDidLoad(movieDetails: movieDetail)
        
        // Then
        XCTAssertEqual(detailViewSpy.showMovieTypeToBeCalled, true, "Display movie type not called")
    }
    
    func test_viewDidLoad_success_display_movie_poster() {
        //setup
        let movieDetail = OMDBMovie.createOMDBMovieModal()
        // When
        detailViewPresenter.viewDidLoad(movieDetails: movieDetail)
        
        // Then
        XCTAssertEqual(detailViewSpy.showMoviePosterToBeCalled, true, "Display movie poster not called")
    }
    
    func test_viewDidLoad_success_display_movie_title() {
        //setup
        let movieDetail = OMDBMovie.createOMDBMovieModal()
        // When
        detailViewPresenter.viewDidLoad(movieDetails: movieDetail)
        
        // Then
        XCTAssertEqual(detailViewSpy.showMovieTitleToBeCalled, true, "Display movie title not called")
    }
    
    func test_viewDidLoad_success_display_movie_release_year() {
        //setup
        let movieDetail = OMDBMovie.createOMDBMovieModal()
        // When
        detailViewPresenter.viewDidLoad(movieDetails: movieDetail)
        
        // Then
        XCTAssertEqual(detailViewSpy.showMovieReleaseyearToBeCalled, true, "Display movie release year not called")
    }
}

