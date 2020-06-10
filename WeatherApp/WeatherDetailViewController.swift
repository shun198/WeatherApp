//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by 廣瀬舜一 on 2020/05/21.
//  Copyright © 2020 廣瀬舜一. All rights reserved.
//

import UIKit
import Alamofire

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var selectedCityTitle: UILabel!
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var highestTemperature: UILabel!
    @IBOutlet weak var lowestTemperature: UILabel!
    @IBOutlet weak var weatherDetail: UILabel!
    var selectedCity:CityModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //当日の日付
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMd", options: 0, locale: Locale(identifier: "ja_JP"))
        todaysDate.text = dateFormatter.string(from: dt)
        if let cityName = selectedCity?.name {
            selectedCityTitle.text = cityName+"の天気"
        }
        
    }
    
}

extension WeatherDetailViewController {
    private var baseApiUrl:URL {
        URL(string: "http://weather.livedoor.com/forecast/webservice/json/v1")!
    }
    
    private var requestUrl:URL {
        let url = baseApiUrl
        var requestUrlString = url.absoluteString
        if let id = selectedCity?.id {
            requestUrlString.append("?city=\(id)")
        }
        return URL(string: requestUrlString)!
    }
    
    func getWeatherData(city :CityModel) {
        AF.request(requestUrl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {(response) in
            switch response.result {
            case .success(let result):
                guard let result = result as? [String: Any] else {
                    return
                }
                
                //本日の日付を取得
                if let forecasts = result["forecasts"] as? [Any],
                    let forecast = forecasts[0] as? [String: Any],
                    let date = forecast["date"] as? String {
                    self.todaysDate.text = date
                }
                
                //本日の最高気温を取得
                if let forecasts = result["forecasts"] as? [Any],
                    let forecast = forecasts[0] as? [String: Any],
                    let temperature = forecast["temperature"] as? [String: Any],
                    let max = temperature["max"] as? [String: Any],
                    let celsius = max["celsius"] as? String
                {
                    self.highestTemperature.text = celsius + "℃"
                }
                
                //本日の最低気温を取得
                if let forecasts = result["forecasts"] as? [Any],
                    let forecast = forecasts[0] as? [String: Any],
                    let temperature = forecast["temperature"] as? [String: Any],
                    let min = temperature["min"] as? [String: Any],
                    let celsius = min["celsius"] as? String
                {
                    self.lowestTemperature.text = celsius + "℃"
                } else {
                    self.lowestTemperature.text = "表記なし"
                }
                
                if let descriptions = result["description"] as? [Any],
                    let description = descriptions[0] as? [String: String],
                    let text = description["text"]
                {
                    self.weatherDetail.text = text
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}




