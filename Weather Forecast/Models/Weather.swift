//
//  Weather.swift
//  Weather Forecast
//
//  Created by Алексей Сердюк on 28.11.2022.
//

import Foundation

//lon: 73.4, lat: 55

enum AppConfiguration : String, CaseIterable {
    case first = "https://api.openweathermap.org/data/3.0/onecall?lat=55&lon=73.44&exclude=current&appid=c0e216da8787c982bc9a94b18f25c3b7"
    case second = "https://api.openweathermap.org/data/2.5/weather?q=Omsk,ru&APPID=c0e216da8787c982bc9a94b18f25c3b7&units=metric"
}

struct CurrentWeather {
    var now : Double = 0
    var min : Double = 0
    var max : Double = 0
    var sunRise : Double = 0
    var sunSet : Double = 0
    var clouds : Int = 0
    var wind : Double = 0
    //var rain : Int = 0
}

var currentWeather = CurrentWeather()


struct NetworkManager {
    static func request(for configuration: AppConfiguration) {
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)

        if let url = URL(string: configuration.rawValue) { // получаем url для запроса
            let task = urlSession.dataTask(with: url, completionHandler: { data, responce, error in

                if let parsedData = data { // разворачиваем опционал, проверяем полученные данные

                    switch configuration {
                    case .first:
                        let str = String(data: parsedData, encoding: .utf8) // преобразовываем полученные даные в строку

                        if let stringToSerilization = str { // разворачиваем опционал, проверяем полученные данные
                            let dataToSerilization = Data(stringToSerilization.utf8) // подготавливаем данные для преобразования в JSON

                            do {
                                if let json = try JSONSerialization.jsonObject(with: dataToSerilization, options: [] ) as? [String: Any] {
                                    print(json)

//                                    if let now = json["main"] as? Any {
//                                        print(now)
//                                    }
                                }
                            } catch let error as NSError {
                                print("Failed to load: \(error.localizedDescription)")
                            }
                        }
                    case .second:
                        do {
                            let decoder = JSONDecoder()
                            //decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let welcome = try decoder.decode(Welcome.self, from: parsedData)
                            print(welcome)

                            currentWeather.now = welcome.main.temp
                            currentWeather.min = welcome.main.tempMin
                            currentWeather.max = welcome.main.tempMax
                            currentWeather.sunRise = welcome.sys.sunrise
                            currentWeather.sunSet = welcome.sys.sunset
                            currentWeather.clouds = welcome.clouds.all
                            currentWeather.wind = welcome.wind.speed
                            //currentWeather.rain = welcome.rain
                        }
                        catch let error {
                            print(error)
                        }
                    }
                }
            })
            task.resume()
        }
    }
}

