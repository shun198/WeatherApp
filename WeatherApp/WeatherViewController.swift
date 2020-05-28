//
//  ViewController.swift
//  WeatherApp
//
//  Created by 廣瀬舜一 on 2020/05/21.
//  Copyright © 2020 廣瀬舜一. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var city = ["札幌","室蘭","仙台","さいたま","東京","横浜"]
    var selectedCity = "札幌"
    
    @IBOutlet weak var weatherPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //デリゲートを設定
        weatherPicker.delegate = self
        weatherPicker.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WeatherDetailViewController" {
            let weatherDetail = segue.destination as! WeatherDetailViewController
            weatherDetail.selectedCity = self.selectedCity
        }
    }

    @IBAction func showWeatherButton(_ sender: Any) {
        
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
        let selected = city[row]
        self.selectedCity = selected
        print(selected)
    }

}

