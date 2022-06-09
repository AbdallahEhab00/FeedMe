//
//  CategoryModel.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 08/06/2022.
//

import Foundation


// MARK: - Category
struct Category: Codable {
    let name, photo: String
}

// MARK: - Newoffer
struct Newoffer: Codable {
    let name: String
    let restauranthID: Int
    let newofferDescription, cover: String
    let cuisines: [Cuisine]

    enum CodingKeys: String, CodingKey {
        case name
        case restauranthID = "RestauranthId"
        case newofferDescription = "description"
        case cover, cuisines
    }
}

// MARK: - Cuisine
struct Cuisine: Codable {
    let name: String
}

// MARK: - Slider
struct Slider: Codable {
    let photo: String
}
