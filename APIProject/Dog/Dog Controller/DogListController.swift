//
//  DogListController.swift
//  APIProject
//
//  Created by Jared Detro on 11/11/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

enum DogListError: Error {
    case failed
}

protocol DogListController {
        func getDogList()
}
