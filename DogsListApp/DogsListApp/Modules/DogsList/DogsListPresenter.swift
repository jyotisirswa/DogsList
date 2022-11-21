//
//  DogsListPresenter.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

protocol DogsListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func refresh()
    func numberOfRowsInSection() -> Int
    func dogs(_ index: Int) -> DogData?
    func didSelectRowAt(index: Int)
}

final class DogsListPresenter : DogsListPresenterProtocol {
    //MARK: - Properties & Variables
    unowned var view: DogsListViewControllerProtocol?
    let router: DogsListRouterProtocol!
    let interactor: DogsListInteractor!
    private var dogsList: [DogData] = []
    
    init(
        view: DogsListViewControllerProtocol,
        router: DogsListRouterProtocol,
        interactor: DogsListInteractor
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    func viewDidLoad() {
        view?.setupTableView()
        view?.showLoadingView()
        fetchDogs()
    }
    
    func viewWillAppear() {
        view?.setUpView()
    }
    
    func refresh() {
        fetchDogs()
    }
    func numberOfRowsInSection() -> Int {
        return dogsList.count
    }
    
    func dogs(_ index: Int) -> DogData? {
        return dogsList[safe : index]
    }
    
    func didSelectRowAt(index: Int) {
        guard let dogObj = dogs(index) else { return }
        router.navigate(.detail(dog: dogObj))
    }
    
    //We can change limit and page as per our requirements, right now as mentioned in doc 105 so I used 105 as constant
    private func fetchDogs(limitObj : Int? = 105, pageObj : Int? = 1) {
        interactor.fetchDogsList(limit: limitObj!, page: pageObj!)
    }
}

//MARK: - Extension +  DogsListInteractorOutputProtocol
extension DogsListPresenter : DogsListInteractorOutputProtocol {
    func fetchDogsList(result: DogsListResult) {
        view?.hideLoadingView()
        switch result {
        case .success(let dogResponse) :
            if dogResponse.count > 0 {
                self.dogsList = dogResponse
                view?.reloadData()
            }
            else {
                print("Dogs List is empty")
            }
        case .failure(let error):
            print(error)
        }
    }
}
                        
                        
