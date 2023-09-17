//
//  WellcomeManager.swift
//  HotelApp-Test
//
//  Created by Александр on 9/11/23.
//

import Foundation
import Alamofire

protocol DecodableModel: Decodable {}

class WellcomeManager {
    
    private var welcomeData: DecodableModel?
    
    func fetchDataFromAPI<T: Decodable>(from url: String, model: T.Type, completion: @escaping (Result<T, Error>, [Room]?) -> Void) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    if let roomList = result as? HotelRoomModel {
                        completion(.success(result), roomList.rooms)
                    } else {
                        completion(.success(result), nil)
                    }
                } catch {
                    completion(.failure(error), nil)
                }
            case .failure(let error):
                completion(.failure(error), nil)
            }
        }
    }
    
    func loadImageData(from url: String, completion: @escaping (Data?) -> Void) {
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print("Error loading image: \(error)")
                completion(nil)
            }
        }
    }
}
