//
//  MoviesListViewController.swift
//  OMDB-Client
//

import UIKit
import Kingfisher

class MoviesListViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var page: Int64 = 1
    
    var configurator = MoviesListViewConfiguratorImplementation()
    var presenter: MoviesListViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if let layout = collectionView.collectionViewLayout as? MovieListLayout {
            layout.delegate = self
        }
        
        configurator.configure(moviesListViewController: self)
        presenter.fetchMovieData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let cv = self.collectionView else { return }
        cv.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       presenter.router.prepare(for: segue, sender: sender)
    }
}


