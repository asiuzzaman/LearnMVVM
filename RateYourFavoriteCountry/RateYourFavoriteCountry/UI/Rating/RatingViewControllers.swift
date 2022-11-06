//
//  RatingViewControllers.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 13/10/22.
//

import UIKit

final class RatingViewControllers: UIViewController {
    private var viewModel: RatingViewModelDelegate!
    
    @IBOutlet weak var ratingTableView: UITableView!
    static func makeViewController() -> RatingViewControllers? {
        let viewController = UIStoryboard(name: "Ratings", bundle: .main)
            .instantiateViewController(withIdentifier: "RatingsViewController")
        guard let ratingsViewController = viewController as? RatingViewControllers else {
            return nil
        }
        
        // need to initiate view model
        ratingsViewController.viewModel = RatingViewModel()
        
        return ratingsViewController
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension RatingViewControllers: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let data = viewModel.cellDataForItem(at: indexPath) else {
            return UITableViewCell()
        }
        
        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "RatingTableViewCell", for: indexPath) as? RatingTableViewCell
        
        guard let cell = dequeueCell else {
            return UITableViewCell()
        }

       // cell.prepare(with: data)
        return cell
                
    }
    
    
}
extension RatingViewControllers: UITableViewDelegate {
    
}

private extension RatingViewControllers {
    
    func setupViewController() {
        view.backgroundColor = UIColor(hexString: "#EFEFF4", alpha: 1.0)
    }
    
    func setupTableView() {
        ratingTableView.register(
            UINib(nibName: "RatingTableViewCell", bundle: .main),
            forCellReuseIdentifier: "RatingTableViewCell"
        )

        ratingTableView.dataSource = self
        ratingTableView.delegate = self
    }
    
    func refresh() {
        viewModel.reloadIconData()
        ratingTableView.reloadData()
    }
    
}

