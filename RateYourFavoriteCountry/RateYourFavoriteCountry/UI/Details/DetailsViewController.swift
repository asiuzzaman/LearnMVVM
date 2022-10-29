//
//  DetailsViewController.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 26/10/22.
//

import UIKit

class DetailsViewController: UIViewController {

    private var viewModel: DetailsViewModelDelegate!
    
    @IBOutlet private weak var holderView: UIView!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var iconCollectionView: UICollectionView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    static func makeViewController(icon: Icon, allowRating: Bool) -> DetailsViewController? {
        let viewController = UIStoryboard(name: "Details", bundle: .main)
            .instantiateViewController(withIdentifier: "DetailsViewController")

        guard let detailsViewController = viewController as? DetailsViewController else {
            return nil
        }

        detailsViewController.viewModel = DetailsViewModel(icon: icon, allowRating: allowRating)
        return detailsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iconCollectionView.reloadData()
    }

}
extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 44, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let iconCount = Int(viewModel.ratingValue)
        var horizontalInset = collectionView.bounds.width
            - CGFloat((10 * (iconCount - 1)) + iconCount * 44)
        horizontalInset = horizontalInset < 0 ? 0 : (horizontalInset / 2.0)

        var verticalInset = (collectionView.bounds.height - 44.0) / 2.0
        verticalInset = verticalInset < 0 ? 0 : verticalInset

        return .init(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
    }
}
extension DetailsViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Int(viewModel.ratingValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dequeuedCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "IconCell",
            for: indexPath
        ) as? IconCell

        guard let cell = dequeuedCell else {
            return UICollectionViewCell()
        }

        cell.prepare(with: UIImage(named: "party"))
        return cell
    }
}
private extension DetailsViewController {
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        let receivedValue = sender.value.rounded()
        let roundedValue = receivedValue
        sender.setValue(roundedValue, animated: false)
        viewModel.setRatingValue(to: Int(roundedValue))
        ratingLabel.text = viewModel.ratingLabel
        navigationItem.rightBarButtonItem?.isEnabled = viewModel.isSavable
        iconCollectionView.reloadData()
    }
    
    func prepareNavigationItem() {
        navigationItem.title = viewModel.title

        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(onSaveButtonClick)
        )

        barButtonItem.isEnabled = viewModel.isSavable
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    
    func prepareView() {
        view.backgroundColor = UIColor(hexString: "#EFEFF4", alpha: 1.0)

        holderView.clipsToBounds = true
        holderView.layer.cornerRadius = 15
        holderView.layer.borderWidth = 1
        holderView.layer.borderColor = UIColor(hexString: "#3697dd").cgColor

        slider.minimumTrackTintColor = UIColor(hexString: "#3697dd")
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = UIColor(hexString: "#3697dd")
        slider.value = Float(viewModel.ratingValue)

        imageView.image = viewModel.iconImage
        ratingLabel.text = viewModel.ratingLabel

        slider.isEnabled = viewModel.allowRating
        slider.isHidden = !viewModel.allowRating

        iconCollectionView.register(
            UINib(nibName: "IconCell", bundle: .main),
            forCellWithReuseIdentifier: "IconCell"
        )

        iconCollectionView.dataSource = self
        iconCollectionView.delegate = self
    }
    
    @objc
    func onSaveButtonClick() {
        viewModel.saveRating()
        navigationController?.popViewController(animated: true)
    }
    
}
