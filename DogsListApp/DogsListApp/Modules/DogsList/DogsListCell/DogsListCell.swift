//
//  DogsListCell.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import UIKit

protocol DogListCellProtocol: AnyObject {
    func setDogImage(_ imageUrl: String)
    func setDogBridLabel(_ text: String)
    func setDogWeight(_ text: String)
    func setDogHeight(_ text: String)
    func setAccessibilityIdentifiers()
}

final class DogsListCell: UITableViewCell {
    
    //MARK: - Properties & Variables
    @IBOutlet weak var viewBG: UIView! {
        didSet {
            viewBG.layer.cornerRadius = 10
            viewBG.clipsToBounds = true
        }
    }
    @IBOutlet private weak var dogImage: CustomImageView!
    @IBOutlet private weak var dogBridLabel: UILabel!
    @IBOutlet private weak var dogWeightLabel: UILabel!
    @IBOutlet private weak var dogHeightLabel: UILabel!
    
    var cellPresenter: DogsListCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension DogsListCell: DogListCellProtocol {
    func setDogImage(_ imageUrl: String) {
        dogImage.loadImageUsingUrlString(urlString: imageUrl)
    }
    
    func setDogBridLabel(_ text: String) {
        dogBridLabel.text = text
    }
    
    func setDogWeight(_ text: String) {
        dogWeightLabel.text = "Weight\n\(text) Kg"
        dogWeightLabel.changeColor(textObj: "\(text) Kg")
    }
    
    func setDogHeight(_ text: String) {
        dogHeightLabel.text = "Height\n\(text) cm"
        dogHeightLabel.changeColor(textObj: "\(text) cm")

    }
}

extension DogsListCell {
    func setAccessibilityIdentifiers() {
        dogImage.accessibilityIdentifier = "dogImage"
        dogBridLabel.accessibilityIdentifier = "dogBridLabel"
        dogHeightLabel.accessibilityIdentifier = "dogHeightLabel"
        dogWeightLabel.accessibilityIdentifier = "dogWeightLabel"
    }
}
