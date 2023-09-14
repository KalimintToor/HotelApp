//
//  NameHotelModel.swift
//  HotelApp-Test
//
//  Created by Александр on 9/11/23.
//

import Foundation

struct Welcome: Decodable {
    let id: Int8
    let name, adress: String
    let minimalPrice: Int32
    let priceForIt: String
    let rating: Int8
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
    
    let wellcomeUrl = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
    
    struct AboutTheHotel: Codable {
        let description: String
        let peculiarities: [String]
    }
}
