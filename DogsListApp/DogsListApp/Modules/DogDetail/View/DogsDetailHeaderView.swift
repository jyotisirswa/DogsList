//
//  DogsDetailHeaderView.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//

import Foundation
import UIKit

protocol DogsDetailHeaderViewProtocol: AnyObject {
    func setDogImage(_ imageUrl: String)
    func setDogBridLabel(_ text: String)
    func setDogBridGroupLabel(_ text: String)
    func setDogWeight(_ text: String)
    func setDogHeight(_ text: String)
    func setTemperament(_ text: String)
    func setOrigin(_ text: String)
    func setAccessibilityIdentifiers()
}

class DogsDetailHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Properties
    @IBOutlet private weak var dogImage: CustomImageView! {
        didSet {
            dogImage.layer.cornerRadius = 15
        }
    }
    @IBOutlet private weak var dogBridLabel: UILabel!
    @IBOutlet private weak var dogWeightLabel: UILabel!
    @IBOutlet private weak var dogHeightLabel: UILabel!
    @IBOutlet private weak var dogTemperament: UILabel!
    @IBOutlet private weak var dogBridGroupLabel: UILabel!
    @IBOutlet private weak var dogOriginLabel: UILabel!
    
    var viewPresenter: DogsDetailHeaderPresenterProtocol! {
        didSet {
            viewPresenter.load()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
//MARK: - Extension +  DogsDetailHeaderViewProtocol
extension DogsDetailHeaderView : DogsDetailHeaderViewProtocol {
    func setDogImage(_ imageUrl: String) {
        dogImage.loadImageUsingUrlString(urlString: imageUrl)

    }
    
    func setDogBridLabel(_ text: String) {
        dogBridLabel.text = text

    }
    
    func setDogBridGroupLabel(_ text: String) {
        dogBridGroupLabel.text = text
    }
    
    func setDogWeight(_ text: String) {
        dogWeightLabel.text = "\(text) Kg"
    }
    
    func setDogHeight(_ text: String) {
        dogHeightLabel.text = "\(text) cm"

    }
    
    func setTemperament(_ text: String) {
        dogTemperament.text = text

    }
    
    func setOrigin(_ text: String) {
        dogOriginLabel.text = text
    }
}

//MARK: - Extension +  setAccessibilityIdentifiers
extension DogsDetailHeaderView {
    func setAccessibilityIdentifiers() {
        dogImage.accessibilityIdentifier = "headerViewDogImage"
        dogBridLabel.accessibilityIdentifier = "headerViewBridLabel"
        dogBridGroupLabel.accessibilityIdentifier = "headerViewBridGroupLabel"
        dogWeightLabel.accessibilityIdentifier = "headerViewdogWeightLabel"
        dogHeightLabel.accessibilityIdentifier = "headerViewdogHeightLabel"
        dogTemperament.accessibilityIdentifier = "headerViewdogTemperament"
        dogOriginLabel.accessibilityIdentifier = "headerViewdogOriginLabel"
    }
}
