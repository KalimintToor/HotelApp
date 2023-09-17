//
//  HotelRoomModel.swift
//  HotelApp-Test
//
//  Created by Александр on 9/14/23.
//

import Foundation

let hotelRoomUrl = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"

struct HotelRoomModel: DecodableModel {
    let rooms: [Room]
}

struct Room: Decodable {
    let id: Int?
    let name: String?
    let price: Int?
    let pricePer: String?
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}

