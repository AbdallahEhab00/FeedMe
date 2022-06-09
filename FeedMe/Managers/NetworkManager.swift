//
//  NetworkManager.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 08/06/2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    private let baseURL = "http://satafood.codesroots.com:3000/api/branches/homepage"
    
    func getCategory( completion:@escaping(Result<[Category],FMError>)->Void){
        guard let url = URL(string: baseURL) else{
            completion(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(FoodModel.self, from: data)
                completion(.success(result.categories))
              
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getOffers( completion:@escaping(Result<[Newoffer],FMError>)->Void){
        guard let url = URL(string: baseURL) else{
            completion(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(FoodModel.self, from: data)
                completion(.success(result.newoffers))
              
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
}
