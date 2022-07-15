//
//  File.swift
//  MVVM_OpenWeatherAPI
//
//  Created by Mitya Kim on 7/14/22.
//


import Foundation

struct WeatherResponce: Decodable {
    let main: Weather
}


struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
    
}
