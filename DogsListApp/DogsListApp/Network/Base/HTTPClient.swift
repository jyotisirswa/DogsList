//
//  HTTPClient.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation
   
final class HTTPClientClass  {
    
    static let shared: HTTPClientClass = {
        let instance = HTTPClientClass()
        return instance
    }()
    
    private init() {
    }
    
    func request<T: Codable>(_ endpoint: Endpoint,
                             decodeToType type: T.Type,
                             completionHandler: @escaping (Result<T,RequestError>) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        guard let url = urlComponents.url else {
            return completionHandler(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data, let utf8Text = String(data: data, encoding: .utf8) else {
                return completionHandler(.failure(.noResponse))
            }
            print("Response: \(response)")
            print("Data: \(utf8Text)")
            print("Error: \(error?.localizedDescription ?? "")")
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(type.self, from: data)
                    DispatchQueue.main.async {
                        return  completionHandler(.success(decodedResponse))
                    }
                }
                catch {
                    return completionHandler(.failure(.decode(error.localizedDescription)))
                }
            case 401:
                return completionHandler(.failure(.unauthorized))
            default:
                return completionHandler(.failure(.unexpectedStatusCode))
            }
        }
        dataTask.resume()
    }
}

