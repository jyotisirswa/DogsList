//
//  EndPoint.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

//MARK: - Endpoints declaration
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] {get}
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.thedogapi.com"
    }
}
