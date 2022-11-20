//
//  DogsListRouter.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

protocol DogsListRouterProtocol: AnyObject {
    func navigate(_ route: DogListRoutes)
}

enum DogListRoutes {
    case detail(dog: DogData)
}

final class DogsListRouter {
    
    //MARK: - Properties
    private weak var viewController: DogsListViewController?
    
    static func createModule(dogsListVCRef: DogsListViewController){
        let interactor = DogsListInteractor()
        let router = DogsListRouter()
        let presenter = DogsListPresenter(view: dogsListVCRef, router: router, interactor: interactor)
        dogsListVCRef.presenter = presenter
        interactor.output = presenter
        router.viewController = dogsListVCRef
    }
}

//MARK: - Extension +  DogsListRouterProtocol
extension DogsListRouter : DogsListRouterProtocol {
    func navigate(_ route: DogListRoutes) {
        switch route {
        case .detail(let dogObj):
            print("Rediring to DogsDetail Page")
//            let detailVC = MovieDetailsViewRouter.createModule(movie: movieObj)
//            viewController?.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
