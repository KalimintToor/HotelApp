//
//  HotelRoomViewComtroller.swift
//  HotelApp-Test
//
//  Created by Александр on 9/13/23.
//

import UIKit
import Alamofire

struct ApiResponse: Codable {
    let id: String
    let data: [DataElement]
    let timestamp: String
}

struct DataElement: Codable {
    let field1: String
    let field2: String
}


class HotelRoomViewComtroller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        let url = "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
        
        AF.request(url).validate().responseDecodable(of: ApiResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                print("Success: ", apiResponse)
                
                // Данные, полученные от API, будут сохранены в переменной apiResponse
                // Вы можете обработать и использовать эти данные здесь
                for dataEntry in apiResponse.data {
                    print("Field1: \(dataEntry.field1), Field2: \(dataEntry.field2)")
                }
                
            case .failure(let error):
                print("Error occurred: ", error)
            }
        }
    }
}



/* экран 2
 {
   "rooms": [
     {
       "id": 1,
       "name": "Стандартный номер с видом на бассейн",
       "price": 186600,
       "price_per": "За 7 ночей с перелетом",
       "peculiarities": [
         "Включен только завтрак",
         "Кондиционер"
       ],
       "image_urls": [
         "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
         "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=",
         "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"
       ]
     },
     {
       "id": 2,
       "name": "Люкс номер с видом на море",
       "price": 289400,
       "price_per": "За 7 ночей с перелетом",
       "peculiarities": [
         "Все включено",
         "Кондиционер",
         "Собственный бассейн"
       ],
       "image_urls": [
         "https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600",
         "https://www.google.com/search?q=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&tbm=isch&ved=2ahUKEwilufKp-4KBAxUfJxAIHR4uAToQ2-cCegQIABAA&oq=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&gs_lcp=CgNpbWcQAzoECCMQJ1CqAVi6HGDmHWgAcAB4AIABXIgB3wySAQIyNZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=Y3fuZOX7KJ_OwPAPntyE0AM&bih=815&biw=1440#imgrc=Nr2wzh3vuY4jEM&imgdii=zTCXWbFgrQ5HBM",
         "https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png"
       ]
     }
   ]

 */

/* экран 3
 {
   "id": 1,
   "hotel_name": "Лучший пятизвездочный отель в Хургаде, Египет",
   "hotel_adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
   "horating": 5,
   "rating_name": "Превосходно",
   "departure": "Москва",
   "arrival_country": "Египет, Хургада",
   "tour_date_start": "19.09.2023",
   "tour_date_stop": "27.09.2023",
   "number_of_nights": 7,
   "room": "Люкс номер с видом на море",
   "nutrition": "Все включено",
   "tour_price": 289400,
   "fuel_charge": 9300,
   "service_charge": 2150
 }
 */
