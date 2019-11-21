//
//  DataUSAModel.swift
//  APIProject
//
//  Created by Jared Detro on 11/14/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

struct DataUSA: Codable {
    var isState: String
    var state: String
    var population: Int
    var year: String
    
    enum CodingKeys: String, CodingKey {
        case isState = "ID State"
        case state = "State"
        case population = "Population"
        case year = "Year"
    }
}

struct StateResult: Codable {
    let stateInfo: [DataUSA]
    
    enum CodingKeys: String, CodingKey {
        case stateInfo = "data"
    }
}
