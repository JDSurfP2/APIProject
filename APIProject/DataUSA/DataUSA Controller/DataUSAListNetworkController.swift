//
//  DataUSAListNetworkController.swift
//  APIProject
//
//  Created by Jared Detro on 11/14/19.
//  Copyright © 2019 Jared Detro. All rights reserved.
//

import Foundation

class DataUSAListNetworkController: StateListController {
    let dataBaseURL = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest")!
    let dataSession = URLSession.shared//Can enter any year from 2013-2017
    
    func getStateResult(completion: @escaping (Result<StateResult, DataUSAListError>) -> Void) {
        let dataRequest = URLRequest(url: dataBaseURL)
        
        let dataTask = dataSession.dataTask(with: dataRequest) { (data, response, error) in
            guard error == nil else {return completion(.failure(.failed))}
            
            if let dataData = data {
                let dataDecoder = JSONDecoder()
                
                do {
                    let dataUSAList = try dataDecoder.decode(StateResult.self, from: dataData)
                    completion(.success(dataUSAList))
                } catch {
                    print(error)
                    completion(.failure(.failed))
                }
            } else {
                completion(.failure(.failed))
            }
        }
        dataTask.resume()
    }
}
