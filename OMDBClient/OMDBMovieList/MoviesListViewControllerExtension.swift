//
//  MoviesListViewControllerExtension.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

extension MoviesListViewController: MoviesListView {
    func reloadCollectionViewData() {
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
}

// MARK: UICollectionViewDataSource

extension MoviesListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        // Configure the cell
        presenter.display(onCell: cell, atIndexPath: indexPath)
        return cell
    }
}


// MARK: UICollectionViewDelegate

extension MoviesListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let presenter = self.presenter else {
            return
        }
        presenter.clickedOnCell(atIndexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let presenter = self.presenter else {
            return
        }
        if(indexPath.row == presenter.movies.count - 1 ) {
            presenter.fetchNextMovieData()
        }
    }
}

extension MoviesListViewController: MoviesListLayoutDelegate {
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath, columnWidth: CGFloat) -> CGFloat {
        // Do any additional setup after loading the view.
        let date = Date()
        let calendar = Calendar.current
        
        let currentYear = calendar.component(.year, from: date)
        
        let titleFont = UIFont.systemFont(ofSize: 16)
        let yearFont = UIFont.systemFont(ofSize: 14)
        var titleHeight: CGFloat = 0
        var yearHeight:CGFloat = 0
        let imageHeight:CGFloat = columnWidth
        if let title = presenter.movies[indexPath.row].title, let year = presenter.movies[indexPath.row].year {
            titleHeight = heightForView(text: title, font: titleFont, width: (columnWidth - 8))
            yearHeight = heightForView(text: "\(currentYear - (Int(year) ?? currentYear)) years ago", font: yearFont, width: (columnWidth - 8) * 0.6)
            
        }
        return imageHeight + titleHeight + yearHeight + 30
    }
}
