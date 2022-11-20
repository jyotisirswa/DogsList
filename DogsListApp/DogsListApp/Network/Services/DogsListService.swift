//
//  DogsListService.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

protocol DogsListServiceProtocol {
    func fetchDogsList(limitObj : Int, pageObj : Int, completionHandler: @escaping (DogsListResult) -> ())
}

struct DogsListService: DogsListServiceProtocol {
    func fetchDogsList(limitObj: Int, pageObj: Int, completionHandler: @escaping (DogsListResult) -> ()) {
        HTTPClientClass.shared.request(ListEndpoint.dogsList(limitObj: limitObj, pageObj: pageObj)  , decodeToType: [DogData].self, completionHandler: completionHandler)
    }
}
