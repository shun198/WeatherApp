//
//  ViewController.swift
//  WeatherApp
//
//  Created by 廣瀬舜一 on 2020/05/21.
//  Copyright © 2020 廣瀬舜一. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let city = ["札幌","室蘭","仙台","さいたま","東京","横浜"]
    
    @IBOutlet weak var weatherPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //デリゲートを設定
        weatherPicker.delegate = self
        weatherPicker.dataSource = self
    }

    @IBAction func showWeatherButton(_ sender: Any) {
        //weatherpickerの値と配列の値が一致する時の処理を書く
    }
    
}



extension WeatherViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let data = city.count
        return data
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cities = city[row]
        return cities
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let row1 = city[row]
        for n in city {
            if row1 == n {
                print(n+"の天気")
//                let weatherDetail = WeatherDetailViewController()
//                weatherDetail.selectedCityTitle.text = n+"の天気"
            }
        }
    }

}

