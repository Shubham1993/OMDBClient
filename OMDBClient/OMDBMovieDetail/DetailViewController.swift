//
//  DetailViewController.swift
//  OMDB-Client
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var releaseYearLabelStackView: UIStackView!
    @IBOutlet weak var movieTitleStackView: UIStackView!
    @IBOutlet weak var typeLabelStackView: UIStackView!
    
    var movieDetails: OMDBMovie!
    
    var configurator = DetailViewConfiguratorImplementation()
    var presenter: DetailViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(detailViewController: self)
        presenter.viewDidLoad(movieDetails: movieDetails)
        
        // Do any additional setup after loading the view.
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
