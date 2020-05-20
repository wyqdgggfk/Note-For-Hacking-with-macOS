//
//  WeatherAPI.swift
//  weatherBar
//
//  Created by Jason on 2020/5/19.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Foundation
class WeatherAPI {
    let API_KEY = "40bb0bd76a057a1f9f5e8ae01fbde246"
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    
  //  "api.openweathermap.org/data/2.5/weather?q={city name}&appid={your api key}"
    
    func fetchWeather(_ query: String) {
        let session = URLSession.shared
        // url-escape the query string we're passed
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        let url = URL(string: "\(BASE_URL)?q=\(escapedQuery!)&appid={\(API_KEY)}")
        let task = session.dataTask(with: url!){data,response,err in
            //first check for a hard error
            if let error = err {
                NSLog("weather api error:\(error)")
            }
            
            // then check the response code
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200: // all good!
                    if let dataString = String(data:data!,encoding: .utf8){
                        NSLog(dataString)
                    }
                case 401://unauthorized
                    NSLog("weather api returned an 'unauthorized' response. Did you set your API key?")
                default:
                    NSLog("weather api returned response:%d %@", httpResponse.statusCode,HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                }
            }
        }
        task.resume()
    }
}
