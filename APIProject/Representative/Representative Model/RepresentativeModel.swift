//
//  RepresentativeModel.swift
//  APIProject
//
//  Created by Jared Detro on 11/11/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

struct RepresentativeList: Codable {
    let repName: String
    let repParty: String
    let repState: String
    let repDistrict: String
    let repPhone: String
    let repOffice: String
    let repLink: URL
    let repResults: [RepresentativeList]
}

struct RepresentativeListItem: Codable {
    let results: [RepresentativeList]
}
