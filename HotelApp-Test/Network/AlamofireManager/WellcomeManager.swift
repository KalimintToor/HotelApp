//
//  WellcomeManager.swift
//  HotelApp-Test
//
//  Created by Александр on 9/11/23.
//

import Foundation
import Alamofire



class WellcomeManager {
    
    private var welcomeData: Welcome?
    
    func fetchDataFromAPI(from url: String, completion: @escaping (Result<Welcome, Error>) -> Void) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    self.welcomeData = welcome
                    completion(.success(welcome))
                    
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
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
