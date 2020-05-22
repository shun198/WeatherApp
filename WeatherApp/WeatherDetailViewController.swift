//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by 廣瀬舜一 on 2020/05/21.
//  Copyright © 2020 廣瀬舜一. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var selectedCityTitle: UILabel!
    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var highestTemperature: UILabel!
    @IBOutlet weak var lowestTemperature: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //当日の日付
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMd", options: 0, locale: Locale(identifier: "ja_JP"))
        todaysDate.text = dateFormatter.string(from: dt)
    }
    
}
    
//pickerviewで選んだ都市をselectedCityTitleに代入
extension WeatherDetailViewController: InputPickerViewDataDelegate {
    func inputCompleted(data: String) {
        selectedCityTitle.text! = "\(data)の天気"
        print(data)
    }
    
    
}

