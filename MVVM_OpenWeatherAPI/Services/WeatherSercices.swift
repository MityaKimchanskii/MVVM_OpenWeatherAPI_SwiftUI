//
//  File.swift
//  MVVM_OpenWeatherAPI
//
//  Created by Mitya Kim on 7/14/22.
//

import Foundation


class WeatherSercices {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> Void) {
        
//    https://api.openweathermap.org/data/2.5/weather?q=London&appid=5c81c55ba1a003a0a197e940dc58c071
        //        5c81c55ba1a003a0a197e940dc58c071
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=5c81c55ba1a003a0a197e940dc58c071") else { completion(nil); return }

        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(url)
            guard let data = data, error == nil else { completion(nil); return }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponce.self, from: data)
            
            if let weatherResponse = weatherResponse {
                let wather = weatherResponse.main
                completion(wather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

