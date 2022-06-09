//
//  FoodModel.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 08/06/2022.
//

import Foundation

struct FoodModel: Codable {
    let categories: [Category]
    let sliders: [Slider]
    let newoffers: [Newoffer]
}
