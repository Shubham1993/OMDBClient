//
//  DetailViewControllerExtension.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension DetailViewController: DetailView {
    
    func showMoviePoster(withPosterUrl posterUrl: String) {
        if(posterUrl != "N/A") {
            moviePosterImageView.kf.indicatorType = .activity
            moviePosterImageView.kf.setImage(with: URL(string: posterUrl))
        } else {
            moviePosterImageView.image = UIImage(named: "movie-poster-coming-soon")
        }
    }
    
    func showMovieTitle(withTitle title: String) {
        if title.count > 0 {
            movieTitleStackView.isHidden = false
            movieTitle.text = title
        } else {
            movieTitleStackView.isHidden = true
        }
    }
    
    func showMovieType(withType type: String) {
        if type.count > 0 {
            typeLabelStackView.isHidden = false
            typeLabel.text = type
        } else {
            typeLabelStackView.isHidden = true
        }
    }
    
    func showMovieReleaseyear(withReleaseYear year: String) {
        if year.count > 0 {
            releaseYearLabelStackView.isHidden = false
            releaseYearLabel.text = year
        } else {
            releaseYearLabelStackView.isHidden = true
        }
    }
}
