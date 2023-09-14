//
//  NameHotelViewModel.swift
//  HotelApp-Test
//
//  Created by Александр on 9/11/23.
//

import UIKit
import Alamofire

class NameHotelViewModel {
    
    private var welcomeData: Welcome?
    private let manager: WellcomeManager
    
    init() {
        self.manager = WellcomeManager()
    }
    
    func fetchData(completion: @escaping () -> Void) {
        guard let url = welcomeData?.wellcomeUrl else {return}
        manager.fetchDataFromAPI(from: url) { [weak self] result in
            switch result {
            case .success(let welcomeData):
                self?.welcomeData = welcomeData
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }


    func getRating() -> Int8? {
        return welcomeData?.rating
    }
    
    func getRatingName() -> String? {
        return welcomeData?.ratingName
    }
    
    func getAdress() -> String? {
        return welcomeData?.adress
    }
    
    func getPrice() -> Int32? {
        return welcomeData?.minimalPrice
    }
    
    func getPriceForIt() -> String? {
        return welcomeData?.priceForIt
    }
    
    func getPeculiarities() -> [String]? {
        return welcomeData?.aboutTheHotel.peculiarities
    }
    
    func getImageUrlsCount() -> Int {
        return welcomeData?.imageUrls.count ?? 3
    }

    func loadImage(at index: Int, completion: @escaping (UIImage?) -> Void) {
        if let url = welcomeData?.imageUrls[index] {
            manager.loadImageData(from: url) { data in
                if let imageData = data {
                    completion(UIImage(data: imageData))
                } else {
                    completion(nil)
                }
            }
        } else {
            completion(nil)
        }
    }
    
    func getDescriptionHotel() -> String?{
        return welcomeData?.aboutTheHotel.description
    }
}
