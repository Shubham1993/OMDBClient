//
//  ApiRequestClientSpy.swift
//  OMDBClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import Alamofire

@testable import OMDBClient

class APIRequestClientSpy: APIRequestClient {
    
    var fetchMovieDataToBeReturned: Result<OMDBSearch>!
    var fetchMovieDataErrorToBeReturned: APIClientError!
    
    func fetchMovieData(withUrl url: String, page: String, completion: @escaping (Result<OMDBSearch>, APIClientError) -> Void) {
        completion(fetchMovieDataToBeReturned, fetchMovieDataErrorToBeReturned)
    }
  
}
