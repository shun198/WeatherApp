//
//  CityModel.swift
//  WeatherApp
//
//  Created by 廣瀬舜一 on 2020/05/21.
//  Copyright © 2020 廣瀬舜一. All rights reserved.
//

import Foundation

struct City {
    static var list = [CityModel(id:"016010" ,name:"札幌"),
                       CityModel(id:"015010" ,name:"室蘭"),
                       CityModel(id:"040010" ,name:"仙台"),
                       CityModel(id:"110010" ,name:"さいたま"),
                       CityModel(id:"130010" ,name:"東京"),
                       CityModel(id:"140010" ,name:"横浜")]
    
}

struct CityModel {
    let id:String
    let name:String
}





