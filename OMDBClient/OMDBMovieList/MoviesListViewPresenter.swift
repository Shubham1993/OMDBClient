//
//  MoviesListViewPresenter.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

private let baseUrl = "http://www.omdbapi.com/?s=Batman&apikey=eeefc96f"

protocol MoviesListCellView {
    func display(posterImageWithUrl url: String)
    func display(movieTitle title: String)
    func display(movieType type: String)
    func display(movieReleaseYear year: String, type: String?)
}

protocol MoviesListView: class {
    func reloadCollectionViewData()
}


protocol MoviesListViewPresenter {
    var movies: [OMDBMovie] { get }
    var router: MoviesListViewRouter { get }
    func viewDidLoad()
    func viewWillAppear()
    func fetchMovieData()
    func fetchNextMovieData()
    func display(onCell cell: MoviesListCellView, atIndexPath indexPath: IndexPath)
    func clickedOnCell(atIndexPath indexPath: IndexPath)
}

class MoviesListViewPresenterImplementation {
    fileprivate var view: MoviesListView
    fileprivate var apiClient: APIRequestClient
    private(set) var router: MoviesListViewRouter
    var allMovies = [OMDBMovie]()
    var page: Int64 = 1
    init(view: MoviesListView, apiClient: APIRequestClient, router: MoviesListViewRouter) {
        self.view = view
        self.apiClient = apiClient
        self.router = router
    }
    
    func fetchMovieData() {
        apiClient.fetchMovieData(withUrl: baseUrl, page: "\(self.page)") { ( result, clientError ) in
            switch result {
            case .success(let value):
                if let newMovies = value.search {
                    for i in newMovies {
                        self.allMovies.append(i)
                    }
                }
                self.view.reloadCollectionViewData()
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    
}

extension MoviesListViewPresenterImplementation: MoviesListViewPresenter {
    
    var movies: [OMDBMovie] {
        get {
            return allMovies
        }
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func display(onCell cell: MoviesListCellView, atIndexPath indexPath: IndexPath) {
        let movie = allMovies[indexPath.row]
        if let posterUrl = movie.poster {
            cell.display(posterImageWithUrl: posterUrl)
            
            if let type = movie.type {
                cell.display(movieType: type)
            }
            
            if let year = movie.year {
                cell.display(movieReleaseYear: year, type: movie.type)
            }
            
            if let title = movie.title {
                cell.display(movieTitle: title)
            }
        }
    }
    
    func clickedOnCell(atIndexPath indexPath: IndexPath) {
        let movie = allMovies[indexPath.row]
        router.moveToDetailView(withMovie: movie)
    }
    
    func fetchNextMovieData() {
        self.page = self.page + 1
        fetchMovieData()
    }
}

