//
//  MovieCollectionViewCell.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 27/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    var types = ["movie": UIColor.red, "series": UIColor.brown, "game": UIColor.blue]
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
}


extension MovieCollectionViewCell: MoviesListCellView {
        
    func display(posterImageWithUrl url: String) {
        if let imageView = moviePosterImageView {
            if url != "N/A" {
                //                cell.moviePosterImageView.maskByRoundingCorners([.topLeft, .topRight], withRadii: CGSize(width: 2, height: 2))
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage(with: URL(string: url))
            } else {
                imageView.image = Image(named: "movie-poster-coming-soon")
            }
        }
    }
    
    func display(movieTitle title: String) {
        if let titleLabel = movieTitleLabel {
            titleLabel.text = title
        }
    }
    
    func display(movieType type: String) {
        if let tl = typeLabel {
            tl.text = type
            if(types.keys.contains(type)) {
                tl.textColor = types[type]
            } else {
                let color = UIColor.randomColor()
                tl.textColor = color
                types[type] = color
            }
        }
    }
    
    func display(movieReleaseYear year: String, type: String?) {
        let date = Date()
        let calendar = Calendar.current
        
        let currentYear = calendar.component(.year, from: date)
        if let ryl  = releaseYearLabel {
            if type == MovieTypes.Series.rawValue {
                ryl.text = year
            } else {
                ryl.text  = "\(currentYear - (Int(year) ?? currentYear)) years ago"
            }
        }
    }
}
