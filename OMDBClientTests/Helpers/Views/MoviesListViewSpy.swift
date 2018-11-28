//
//  MoviesListViewSpy.swift
//  OMDBClientTests
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

@testable import OMDBClient

class MoviesListViewSpy: MoviesListView {
    
    var reloadCollectionViewDataToBeCalled = false

    func reloadCollectionViewData() {
        reloadCollectionViewDataToBeCalled = true
    }
}
