//
//  Dog.swift
//  DogsListApp
//
//  Created by Jyoti on 20/11/2022.
//

import Foundation

//MARK: - DogElements
struct DogData: Codable {
    let weight, height: WHData?
    let id: Int
    let name, bredFor, breedGroup, lifeSpan: String?
    let temperament, origin, referenceImageID: String?
    let image: ImageData?
    var isFvrtAdded : Bool? {
        guard let isFvrt = UserDefaults.standard.value(forKey: "\(id)") as? Bool else {
            return false
        }
        return isFvrt
    }

    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament, origin
        case referenceImageID = "reference_image_id"
        case image
    }
}

//MARK: - WHData
struct WHData: Codable {
    let imperial, metric: String?
}

//MARK: - ImageData
struct ImageData: Codable {
    let id: String
    let width, height: Int?
    let url: String?
}

typealias DogsListResult = Result<[DogData], RequestError>

