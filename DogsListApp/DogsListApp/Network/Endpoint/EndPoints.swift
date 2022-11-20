//
//  EndPoints.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

enum ListEndpoint {
    case dogsList(limitObj : Int, pageObj : Int)
}

extension ListEndpoint: Endpoint {
    var path: String {
        switch self {
        case .dogsList:
            return "/v1/breeds"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .dogsList(limitObj: let limit, pageObj: let page) :
            return [URLQueryItem(name : "limit", value : "\(limit)"), URLQueryItem(name: "page", value: "\(page)")]
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .dogsList:
            return .get
        }
    }
    var header: [String: String]? {
        switch self {
        case .dogsList:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .dogsList:
            return nil
        }
    }
}
