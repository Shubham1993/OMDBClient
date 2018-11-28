//
//  MoviesListViewPresenter.swift
//  OMDB-ClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import XCTest
@testable import OMDBClient

enum APIClientError {
    case kSuccess
    case kAddedInOffline
    case kNetworkConnectionError
    case kParseError
    case kEmptyListError
    case kUnknownError
    case k500Error
}

class MoviesListViewPresenterTest: XCTestCase {
    
    let moviesListViewRouterSpy = MoviesListViewRouterSpy()
    let moviesListViewSpy = MoviesListViewSpy()
    let apiClientSpy = APIRequestClientSpy()
    
    var moviesListViewPresenter: MoviesListViewPresenterImplementation!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moviesListViewPresenter = MoviesListViewPresenterImplementation(view: moviesListViewSpy, apiClient: apiClientSpy, router: moviesListViewRouterSpy)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moviesListViewPresenter = nil
        super.tearDown()
    }
    
    func test_fetch_movie_list_success() {
        //given
        apiClientSpy.fetchMovieDataToBeReturned = .success(OMDBSearch.createOMDBSearchModal())
        apiClientSpy.fetchMovieDataErrorToBeReturned = APIClientError.kSuccess

        //when
        moviesListViewPresenter.fetchMovieData()
        
        //then
        XCTAssertEqual(moviesListViewSpy.reloadCollectionViewDataToBeCalled, true, "reload Collection View Data not called ")
    }
}
