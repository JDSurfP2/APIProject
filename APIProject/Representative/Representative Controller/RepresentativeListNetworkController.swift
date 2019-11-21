//
//  RepresentativeListNetworkController.swift
//  APIProject
//
//  Created by Jared Detro on 11/11/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

struct RepresentativeListNetworkController: RepresentativeListController {
    let baseURL = "https://whoismyrepresentative.com/getall_mems.php?&output=json&zip="
    let session = URLSession.shared
    let path: String
    
    func getRepresentativeList(completion: @escaping (Result<[Representative], RepresentativeListError>) -> Void) {
        let representativeListURL = URL(string: baseURL + path)!
        
        let request = URLRequest(url: representativeListURL)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {return completion(.failure(.failed))}
            
            if (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let representativeList = try decoder.decode(RepresentativeListItem.self, from: data)
                    completion(.success(representativeList.results))
                } catch {
                    print(error)
                    completion(.failure(.failed))
                }
            } else {
                completion(.failure(.failed))
            }
        }
        task.resume()
    }
}
