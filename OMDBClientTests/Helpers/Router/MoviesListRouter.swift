//
//  MoviesListRouter.swift
//  OMDBClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation


import Foundation
@testable import OMDBClient

class MoviesListViewRouterSpy: MoviesListViewRouter {
    
    var moveToDetailViewToBeCalled = false
    
    func moveToDetailView(withMovie movie: OMDBMovie) {
        moveToDetailViewToBeCalled = true
    }
    
}
