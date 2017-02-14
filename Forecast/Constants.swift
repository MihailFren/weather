//
//  Constants.swift
//  Forecast
//
//  Created by Oleg Marchik on 2/10/17.
//  Copyright © 2017 Oleg Marchik. All rights reserved.
//

struct Constants {
    struct OpenWeatherMap {
        static let apiKey = "0f1d0cf47de70dae65f65a41d213b0ec"
        static func weatherByCoordinatesURL(latitude: Double, longitude: Double) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&lang=ru&appid=\(Constants.OpenWeatherMap.apiKey)"
        }
    }
}
