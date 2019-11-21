//
//  RepresentativeListController.swift
//  APIProject
//
//  Created by Jared Detro on 11/11/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

enum RepresentativeListError: Error {
    case failed
}

protocol RepresentativeListController {
    func getRepresentativeList(completion: @escaping (Result<[Representative], RepresentativeListError>) -> Void)
}
