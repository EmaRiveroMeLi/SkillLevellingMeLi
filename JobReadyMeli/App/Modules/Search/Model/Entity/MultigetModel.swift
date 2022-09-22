//
//  MultigetModel.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 13/09/2022.
//

import Foundation

typealias Products = [Product]

struct Product: Codable {
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let id: String
    let title: String
    let categoryId: String
    let price: Double
    let condition: String
    let secureThumbnail: String
    let sellerAddress: SellerAddress
    let pictures: [Picture]
    let status: String
}

struct Picture: Codable {
    let secureUrl: String
}

struct SellerAddress: Codable {
    let city: City
    let state: State
    let country: Country
}

struct City: Codable {
    let name: String
}
struct State: Codable {
    let name: String
}
struct Country: Codable {
    let name: String
}
