//
//  DogsDetailRouter.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//

import Foundation
import UIKit

protocol DogsDetailRouterProtocol: AnyObject {
    func navigate()
}

final class DogsDetailRouter {

    //MARK: - Properties
    weak var viewController: DogsDetailsViewController?
    
    static func createModule(dogsData : DogData) -> DogsDetailsViewController {
        let viewController = UIStoryboard.init(name: StoryBoard.Main.rawValue, bundle: .main).instantiateViewController(withIdentifier: "DogsDetailsViewController") as! DogsDetailsViewController
        let router = DogsDetailRouter()
        let presenter = DogsDetailsPresenter(view: viewController, router: router, dogsData: dogsData)
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

extension DogsDetailRouter : DogsDetailRouterProtocol {
    func navigate() {
        
    }
}
