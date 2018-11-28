//
//  MoviesListViewConfigurator.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

protocol MoviesListViewConfigurator {
    func configure(moviesListViewController: MoviesListViewController)
}

class MoviesListViewConfiguratorImplementation: MoviesListViewConfigurator {
    
    func configure(moviesListViewController: MoviesListViewController) {
        let apiClient = APIRequestClientImplementation()
        let router = MoviesListViewRouterImplementation(moviesListViewController: moviesListViewController)
        let presenter = MoviesListViewPresenterImplementation(view: moviesListViewController, apiClient: apiClient, router: router)
        
        moviesListViewController.presenter = presenter
    }
}
