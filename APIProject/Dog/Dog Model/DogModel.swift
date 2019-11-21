//
//  DogModel.swift
//  APIProject
//
//  Created by Jared Detro on 11/18/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

struct Dog: Codable {
    let message: String
    let status: String
    let link: String
}

struct DogListItem: Codable {
    let dogResults: [Dog]
}
