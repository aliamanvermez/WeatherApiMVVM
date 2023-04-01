//
//  WAPWeatherAPIViewModel.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 26.03.2023.
//

import Foundation
import UIKit
class WAPWeatherAPIViewModel {
    var weatherDataArray : [WeatherData] = []
    let decoder = JSONDecoder()
    var weatherData : WeatherData?
    var urlString : String?
    var onDataLoaded: (() -> Void)?
    let apiKey = "15fdaaa4d02f4e099a5194406232903"
    let cities = ["Istanbul", "Ankara", "Izmir", "Bursa", "London", "Berlin", "Paris", "Rome", "Moscow", "Tokyo"]

    
    func getData(completion : @escaping (Error?) -> ()) {
        ///API key
        
        ///10 farklı şehri aray içinde aldık
        
        ///URLSession ile bu şehirlerin verilerini çektik
        for city in cities {
            urlString =  "https://api.weatherapi.com/v1/current.json?key=\(self.apiKey)&q=\(city)&lang=tr"
            
            if let url = URL(string: urlString!) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("Error fetching data: \(error)")
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse,
                          httpResponse.statusCode == 200,
                          let jsonData = data else {
                        print("Error in response")
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let weatherData = try decoder.decode(WeatherData.self, from: jsonData)
                        self.weatherDataArray.append(weatherData)
                        print(self.weatherDataArray[0].current)
                        completion(nil)
                        if self.weatherDataArray.count == self.cities.count {
                            self.onDataLoaded?()
                            
                        }
                    } catch let error {
                        completion(error)
                    }
                }.resume()
            }
        }
    }
}



      
        
        
        
        
        
        
        
        
        
        
        //    func updateTemperatureLabel(_ label: UILabel) {
        //        if let temperature = weatherData?.current.temp_c {
        //          label.text = "\(temperature)°C"
        //        }
        //    }
        
        
