//
//	OMDBSearch.swift
//
//	Create by Shubham Gupta on 27/10/2018
//	Copyright © 2018 Perpule 1Pay. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct OMDBMovie : EntityType {

	var poster : String!
	var title : String!
	var type : String!
	var year : String!
	var imdbID : String!

    enum CodingKeys: String, CodingKey {
        case poster = "Poster"
        case title = "Title"
        case year =  "Year"
        case type = "Type"
        case imdbID
    }
}
