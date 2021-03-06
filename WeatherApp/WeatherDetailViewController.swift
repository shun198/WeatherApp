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
    @IBOutlet weak var tomorrowsDate: UILabel!
    @IBOutlet weak var highestTemperature: UILabel!
    @IBOutlet weak var lowestTemperature: UILabel!
    @IBOutlet weak var weatherDetail: UILabel!
    var selectedCity:CityModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherDetail.numberOfLines = 0
        if let cityName = selectedCity?.name {
            selectedCityTitle.text = cityName+"の天気"
        }
        getWeatherData(city: selectedCity!)
        
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
                
                //翌日の日付を取得
                if let forecasts = result["forecasts"] as? [Any],
                    let forecast = forecasts[1] as? [String: Any],
                    let date = forecast["date"] as? String
                {
                    self.tomorrowsDate.text = date
                }
                
                //翌日の最高気温を取得
                if let forecasts = result["forecasts"] as? [Any],
                    let forecast = forecasts[1] as? [String: Any],
                    let temperature = forecast["temperature"] as? [String: Any],
                    let max = temperature["max"] as? [String: Any],
                    let celsius = max["celsius"] as? String
                {
                    self.highestTemperature.text = celsius + "℃"
                }
                
                //本日の最低気温を取得
                if let forecasts = result["forecasts"] as? [Any],
                    let forecast = forecasts[1] as? [String: Any],
                    let temperature = forecast["temperature"] as? [String: Any],
                    let min = temperature["min"] as? [String: Any],
                    let celsius = min["celsius"] as? String
                {
                    self.lowestTemperature.text = celsius + "℃"
                } else {
                    self.lowestTemperature.text = "表記なし"
                }
                
                if let descriptions = result["description"] as? [String: String],
                    let text = descriptions["text"]
                {
                    self.weatherDetail.text = text
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}




