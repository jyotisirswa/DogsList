//
//  DogsListInteractor.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

//MARK: - Protocols +  DogsListInteractorProtocol
protocol DogsListInteractorProtocol: AnyObject {
    func fetchDogsList(limit : Int, page : Int)
}

//MARK: - Protocols +  DogsListInteractorOutputProtocol
protocol DogsListInteractorOutputProtocol: AnyObject {
    func fetchDogsList(result: DogsListResult)
}

fileprivate var dogsService: DogsListServiceProtocol = DogsListService()

final class DogsListInteractor {
    var output: DogsListInteractorOutputProtocol?
}

extension DogsListInteractor : DogsListInteractorProtocol {
    func fetchDogsList(limit : Int, page : Int) {
        dogsService.fetchDogsList(limitObj: limit, pageObj: page) { [weak self] result in
            guard let self = self else { return }
            self.output?.fetchDogsList(result: result)
        }
    }
}
