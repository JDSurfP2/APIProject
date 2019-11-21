//
//  DogListNetworkController.swift
//  APIProject
//
//  Created by Jared Detro on 11/18/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

//struct DogListNetworkController: DogListController {
//    let dogbaseURL = "https://dog.ceo/api/breeds/image/random"
//    let dogSession = URLSession.shared
//
//    func getDogList(completion: @escaping (Result<Dog, DogListError>) -> Void) {
//        let dogListURL = URL(string: dogbaseURL)!
//
//        let dogRequest = URLRequest(url: dogListURL)
//
//        let dogTask = dogSession.dataTask(with: dogRequest) { (data, response, error) in
//            guard error == nil else {return completion(.failure(.failed))}
//
//            if (response as? HTTPURLResponse)?.statusCode == 200,
//                let data = data {
//                let dogDecoder = JSONDecoder()
//
//                do {
//                    let dogList = try dogDecoder.decode(DogListItem.self, from: data)
//                    completion(.success(dogList.dogResults))
//                } catch {
//                    print(error)
//                    completion(.failure(.failed))
//                }
//            } else {
//                completion(.failure(.failed))
//            }
//        }
//        dogTask.resume()
//    }
//}
