//
//  HotelRoomViewModel.swift
//  HotelApp-Test
//
//  Created by Александр on 9/14/23.
//

import Foundation

class HotelRoomViewModel {
    var rooms: [Room] = []
    private let manager: WellcomeManager
    
    init() {
        self.manager = WellcomeManager()
    }
    
    func fetchData(completion: @escaping () -> Void) {
        manager.fetchDataFromAPI(from: hotelRoomUrl, model: HotelRoomModel.self) { (result: Result<HotelRoomModel, Error>, rooms: [Room]?) in
                switch result {
                case .success(let hotelRoomModel):
                    self.rooms = hotelRoomModel.rooms
                    completion()
                case .failure(let error):
                    print(error)
                    completion()
                }
            }
    }

}

