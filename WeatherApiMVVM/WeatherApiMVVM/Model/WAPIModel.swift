//
//  WeatherData.swift
//  WeatherApiMVVM
//
//  Created by Ali Amanvermez on 26.03.2023.
//

import Foundation

struct WeatherData: Codable {
    let location: Location
    let current: Current
    
    //init fonksiyonunu collection view için kullandık
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decode(Location.self, forKey: .location)
        self.current = try container.decode(Current.self, forKey: .current)
    }
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
}

struct Current: Codable {
    let temp_c: Double
    let temp_f: Double
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
}


/*
 
 */




