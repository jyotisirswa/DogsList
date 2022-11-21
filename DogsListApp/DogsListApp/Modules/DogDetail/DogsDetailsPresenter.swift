//
//  DogsDetailsPresenter.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//

import Foundation

//MARK: - Protocols +  DogsDetailsPresenterProtocol
protocol DogsDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func getDog() -> DogData?
    func addFvrtButtonTapped()
}

final class DogsDetailsPresenter: DogsDetailsPresenterProtocol {
    
    unowned var view: DogsDetailsViewControllerProtocol?
    let router: DogsDetailRouterProtocol!
    private var dogsData: DogData?
    
    init(
        view: DogsDetailsViewControllerProtocol,
        router: DogsDetailRouterProtocol,
        dogsData : DogData
    ) {
        self.view = view
        self.router = router
        self.dogsData = dogsData
    }
    
    func viewDidLoad() {
        view?.setupTableView()
        view?.setFvrtButton(dogsData?.isFvrtAdded == true ? Constants.removeFvrt : Constants.addFvrt)
        view?.reloadData()
    }
    
    func viewWillAppear() {
        view?.setUpView()
    }
    
    func getDog() -> DogData? {
        return dogsData
    }
    func addFvrtButtonTapped() {
        if let dogData = self.dogsData,  let isFvrt = self.dogsData?.isFvrtAdded {
            if !isFvrt {
                UserDefaults.standard.set(true, forKey: "\(dogData.id)")
            } else {
                UserDefaults.standard.removeObject(forKey: "\(dogData.id)")
            }
        }
        view?.setFvrtButton(dogsData?.isFvrtAdded == true ? Constants.removeFvrt : Constants.addFvrt)
    }
}

//MARK: - Protocol +  MovieDetailsHeaderPresenter
extension DogsDetailsPresenter {
    fileprivate enum Constants {
        static let addFvrt: String = "Add to favorites"
        static let removeFvrt: String = "Remove from favorites"
    }
}


