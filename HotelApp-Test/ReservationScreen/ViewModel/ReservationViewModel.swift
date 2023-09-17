//
//  ReservationViewModel.swift
//  HotelApp-Test
//
//  Created by Александр on 9/17/23.
//

import Foundation

class ReservationViewModel{
    private var reservationData: ReservationModel?
    private let manager: WellcomeManager
    
    init() {
        self.manager = WellcomeManager()
    }
    
    func fetchData(completion: @escaping () -> Void) {
        manager.fetchDataFromAPI(from: reservationUrl, model: ReservationModel.self) { [weak self] result,_   in
            switch result {
            case .success(let reservationData):
                self?.reservationData = reservationData
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getHRating() -> Int8? {
        return reservationData?.horating
    }
}
