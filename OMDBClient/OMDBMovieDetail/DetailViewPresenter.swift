//
//  DetailViewPresenter.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

protocol DetailView: class {
    func showMoviePoster(withPosterUrl url: String)
    func showMovieTitle(withTitle title: String)
    func showMovieType(withType type: String)
    func showMovieReleaseyear(withReleaseYear year: String)
}


protocol DetailViewPresenter {
    var router: DetailViewRouter { get }
    func viewDidLoad(movieDetails: OMDBMovie)
    func viewWillAppear()
}

class DetailViewPresenterImplementation {
    
    fileprivate var view: DetailView
    internal var router: DetailViewRouter
    init(view: DetailView, router: DetailViewRouter) {
        self.view = view
        self.router = router
    }
}

extension DetailViewPresenterImplementation: DetailViewPresenter {
    func viewDidLoad(movieDetails: OMDBMovie) {
        
        let date = Date()
        let calendar = Calendar.current
        
        let currentYear = calendar.component(.year, from: date)
        
        if let posterUrl = movieDetails.poster, let title =  movieDetails.title, let type = movieDetails.type, let year = movieDetails.year {
            var releaseYear = year
            self.view.showMoviePoster(withPosterUrl: posterUrl)
            self.view.showMovieType(withType: type)
            self.view.showMovieTitle(withTitle: title)
            if type == MovieTypes.Series.rawValue {
                releaseYear = year
            } else {
                releaseYear = "\(currentYear - (Int(year) ?? currentYear)) years ago"
            }
            self.view.showMovieReleaseyear(withReleaseYear: releaseYear)
        }
    }
    
    func viewWillAppear() {
        
    }
}
