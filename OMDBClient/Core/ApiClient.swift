//
//  ApiClient.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 27/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import Alamofire

enum APIClientError {
    case kSuccess
    case kAddedInOffline
    case kNetworkConnectionError
    case kParseError
    case kEmptyListError
    case kUnknownError
    case k500Error
}

extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}

protocol APIRequestClient {
    func fetchMovieData(withUrl url: String, page: String, completion:@escaping (_ result: Result<OMDBSearch>, _ clientError: APIClientError)->Void)
}


class APIRequestClientImplementation: APIRequestClient {
     func fetchMovieData(withUrl url: String, page: String, completion:@escaping (_ result: Result<OMDBSearch>, _ clientError: APIClientError)->Void) {
        Alamofire.request("\(url)&page=\(page)").responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success:
                do {
                    let responseObject = try JSONSerialization.jsonObject(with: response.data!, options: []) as? NSDictionary
                    guard responseObject != nil else {
                        throw NSError.createError(withMessage: "Failed to get omdbsearch list")
                    }
                    guard let data = response.data, let omdbSearch: OMDBSearch = try? OMDBSearch.decodeObject(withData: data) else {
                        throw NSError.createError(withMessage: "Failed to get omdbsearch list")
                    }
                    print(omdbSearch)
                    completion(.success(omdbSearch), .kSuccess)
                } catch let error {
                    completion(.failure(error), .kParseError)
                }
                break
            case .failure(let error):
                guard let statusCode = response.response?.statusCode, statusCode == 201 else {
                    completion(.failure(error), .kUnknownError)
                    break
                }
                completion(.failure(error), .kEmptyListError)
                break
            }
            
        }
    }
}
