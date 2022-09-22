//
//  ApiManager.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 13/09/2022.
//

import Foundation
import UIKit

class SearchService {
    
    
    func getCategory(query: String, onSuccess: @escaping ([CategoryModel]) -> Void){
        
        ApiManager.shared.fetchCall(url: "\(Endpoint.categoryEndpoint)\(query)") { response in
            guard let data = response else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let result = try decoder.decode(Category.self, from: data)
                onSuccess(result)
            } catch {
                print(String(describing: error))
            }
        } onError: { error in
            print(String(describing: error))
        }
    }
    
    func getTopTwenty(id: String, onSuccess: @escaping (String) -> Void) {
        
        ApiManager.shared.fetchCall(url: "\(Endpoint.top20Endpoint)\(id)") { response in
            guard let data = response else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let result = try decoder.decode(TopTwentyModel.self, from: data)
                let items = result.content.map {$0.id}.joined(separator: ",")
                onSuccess(items)
            } catch {
                print(String(describing: error))
            }
        } onError: { error in
            print(String(describing: error))
        }
    }
    
    func getProductDetail(id: String, onSuccess: @escaping ([Product]) -> Void){
        
        ApiManager.shared.fetchCall(url: "\(Endpoint.productDetailEndpoint)\(id)") { response in
            guard let data = response else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let result = try decoder.decode(Products.self, from: data)
                onSuccess(result)
            } catch {
                print(String(describing: error))
            }
        } onError: { error in
            print(String(describing: error))
        }
    }
}
