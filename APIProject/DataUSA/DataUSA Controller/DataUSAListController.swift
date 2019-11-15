//
//  DataUSAListController.swift
//  APIProject
//
//  Created by Jared Detro on 11/14/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

enum DataUSAListError: Error {
    case failed
}

protocol StateListController {
    func getStateResult(completion: @escaping (Result<StateResult, DataUSAListError>) -> Void)
}
