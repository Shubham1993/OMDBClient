//
//	OMDBMovie.swift
//
//	Create by Shubham Gupta on 27/10/2018
//	Copyright © 2018 Perpule 1Pay. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

enum MovieTypes: String  {
    case Movie = "movie"
    case Series = "series"
    case Game = "game"
}

struct OMDBSearch: EntityType {

	var response : String!
	var search : [OMDBMovie]!
	var totalResults : String!
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case search = "Search"
        case totalResults
    }

}
