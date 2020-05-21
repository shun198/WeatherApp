//
//  ViewController.swift
//  WeatherApp
//
//  Created by 廣瀬舜一 on 2020/05/21.
//  Copyright © 2020 廣瀬舜一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    

}

struct DataModel {
    let cityModel = [""]
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cities = city[row]
        return cities
    }


}

