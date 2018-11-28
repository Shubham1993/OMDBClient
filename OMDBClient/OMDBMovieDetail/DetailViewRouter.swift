//
//  DetailViewRouter.swift
//  OMDB-Client
//
//  Created by Shubham Gupta on 29/10/18.
//  Copyright © 2018 OMDB. All rights reserved.
//

import Foundation
import UIKit

// MARK: - DetailViewRouter

protocol DetailViewRouter: ViewRouter {
    
}

// MARK: - DetailViewRouterImplementation

class DetailViewRouterImplementation {
    
    fileprivate weak var detailViewController: DetailViewController?
    
    init(detailViewController: DetailViewController) {
        self.detailViewController = detailViewController
    }
}


extension DetailViewRouterImplementation: DetailViewRouter {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
