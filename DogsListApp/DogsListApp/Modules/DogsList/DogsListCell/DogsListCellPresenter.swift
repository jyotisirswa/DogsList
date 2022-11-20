//
//  DogsListCellPresenter.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

protocol DogsListCellPresenterProtocol: AnyObject {
    func load()
}

final class DogsListCellPresenter {
    //MARK: - Properties
    weak var view: DogListCellProtocol?
    private let dogData: DogData
    
    init(view: DogListCellProtocol?, dogData: DogData) {
        self.view = view
        self.dogData = dogData
    }
}

//MARK: - Extension + DogsListCellPresenterProtocol
extension DogsListCellPresenter : DogsListCellPresenterProtocol {
    func load() {
        if  let url = dogData.image?.url {
            view?.setDogImage(url)
        }
        if let name = dogData.name {
            view?.setDogBridLabel(name)
        }
        if let weight = dogData.weight?.metric {
            view?.setDogWeight(weight)
        }
        if let height = dogData.height?.metric {
            view?.setDogHeight(height)
        }
        view?.setAccessibilityIdentifiers()
    }
}
