//
//  RepresentativeModel.swift
//  APIProject
//
//  Created by Jared Detro on 11/11/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

struct RepresentativeList: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: URL
    let results: [RepresentativeList]
}

struct RepresentativeListItem: Codable {
    let results: [RepresentativeList]
}
