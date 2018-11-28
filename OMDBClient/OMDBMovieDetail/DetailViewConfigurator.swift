//
//  DetailViewConfigurator.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation

protocol DetailViewConfigurator {
    func configure(detailViewController: DetailViewController)
}

class DetailViewConfiguratorImplementation: DetailViewConfigurator {
    
    func configure(detailViewController: DetailViewController) {
        let router = DetailViewRouterImplementation(detailViewController: detailViewController)
        let presenter = DetailViewPresenterImplementation(view: detailViewController, router: router)
        
        detailViewController.presenter = presenter
    }
}
