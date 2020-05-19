//
//  WeatherAPI.swift
//  weatherBar
//
//  Created by Jason on 2020/5/19.
//  Copyright © 2020 jiangrenandu. All rights reserved.
//

import Foundation
class WeatherAPI {
    let API_KEY = "Your-API-Key-Here"
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(_ query: String) {
        let session = URLSession.shared
        // url-escape the query string we're passed
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        let url = URL(string: "\(BASE_URL)?APPID=\(API_KEY)&units=imperial&q=\(escapedQuery!)")
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
