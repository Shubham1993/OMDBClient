//
//  MoviesListViewRouter.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

import UIKit

protocol MoviesListViewRouter: ViewRouter {
    func moveToDetailView(withMovie movie: OMDBMovie)
}

class MoviesListViewRouterImplementation {
    
    fileprivate weak var moviesListViewController: MoviesListViewController?
    
    init(moviesListViewController: MoviesListViewController) {
        self.moviesListViewController = moviesListViewController
    }
}

// MARK: - SendOTPViewRouter

extension MoviesListViewRouterImplementation: MoviesListViewRouter {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue", let movie = sender as? OMDBMovie {
            let detailsVC = segue.destination as? DetailViewController
            detailsVC?.movieDetails = movie
        }
    }
    
    func moveToDetailView(withMovie movie: OMDBMovie) {
        guard let vc = moviesListViewController else {
            return
        }
        vc.performSegue(withIdentifier: "detailSegue", sender: movie)
    }
}
