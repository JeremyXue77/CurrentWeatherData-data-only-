//
//  CurrentWeatherData.swift
//  Current Weather Data
//
//  Created by JeremyXue on 2018/8/13.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Decodable {
    var name: String
    var id: Int
    var dt: TimeInterval
    
    var coord: Coord
    var main: Main
    var weather: [Weather]
}

struct Coord: Decodable {
    var lon: Double
    var lat: Double
}

struct Main: Decodable {
    var temp: Double
    var humidity: Int
    var temp_min: Double
    var temp_max: Double
}

struct Weather: Decodable {
    var icon: String
    var main: String
    var description: String
}
