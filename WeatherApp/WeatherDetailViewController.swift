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
        let weather = WeatherViewController()
        //最初札幌がpickerの中で一番はじめに選ばれるため、タイトルは札幌の天気になる
//        let city = weather.city
        let pickerView = UIPickerView()
        let row:Int = 0
        let picker = weather.pickerView(pickerView, titleForRow: row, forComponent: 0)
        print(picker!+"の天気テスト")
        
        
        //当日の日付
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMd", options: 0, locale: Locale(identifier: "ja_JP"))
        todaysDate.text = dateFormatter.string(from: dt)
    }
}

        
    

