//
//  DogsDetailHeaderPresenter.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//

import Foundation

//MARK: - Protocol +  DogsDetailHeaderPresenterProtocol
protocol DogsDetailHeaderPresenterProtocol: AnyObject {
    func load()
}
final class DogsDetailHeaderPresenter {
    
    weak var view: DogsDetailHeaderViewProtocol?
    private let dogData: DogData
    
    init(view: DogsDetailHeaderViewProtocol?,  dogData: DogData) {
        self.view = view
        self.dogData = dogData
    }
}

extension DogsDetailHeaderPresenter : DogsDetailHeaderPresenterProtocol {
    func load() {
        if  let url = dogData.image?.url {
            view?.setDogImage(url)
        }
        if let name = dogData.name {
            view?.setDogBridLabel(name)
        }
        if let group = dogData.breedGroup {
            view?.setDogBridGroupLabel(group)
        }
        if let weight = dogData.weight?.metric {
            view?.setDogWeight(weight)
        }
        if let height = dogData.height?.metric {
            view?.setDogHeight(height)
        }
        if let temperament = dogData.temperament {
            view?.setTemperament(temperament)
        }
        if let origin = dogData.origin {
            view?.setOrigin(origin)
        }
        else  {
            view?.setOrigin("N/A")
        }
        view?.setAccessibilityIdentifiers()
    }
}
