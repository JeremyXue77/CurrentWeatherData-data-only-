//
//  ViewController.swift
//  Current Weather Data
//
//  Created by JeremyXue on 2018/8/13.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

// TODO: Register OpenWeatherMap account to get your API key.
struct APIKeys {
    static let apikey = "Your API key."
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData(city: "Taipei")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Get current weather data
    func getWeatherData(city:String) {
        let address = "https://api.openweathermap.org/data/2.5/weather?"
        if let url = URL(string: address + "q=\(city)" + "&units=metric&lang=zh_tw" + "&appid=" + APIKeys.apikey) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print("Status code: \(response.statusCode)")
                    let decoder = JSONDecoder()
                    
                    if let weatherData = try? decoder.decode(CurrentWeatherData.self, from: data) {
                        print("============== Weather data ==============")
                        print(weatherData)
                        print("============== Weather data ==============")
                        print("城市名稱: \(weatherData.name)")
                        print("經緯度: (\(weatherData.coord.lon),\(weatherData.coord.lat))")
                        print("溫度: \(weatherData.main.temp)°C")
                        print("描述: \(weatherData.weather[0].description)")
                    }
                }
                }.resume()
        } else {
            print("Invalid URL.")
        }
    }
    
}

