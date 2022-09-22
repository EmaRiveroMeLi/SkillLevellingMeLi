//
//  ProductDescriptionService.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 18/09/2022.
//

import Foundation

class ProductDescriptionService {
    func getProductDescription(id: String, onSuccess: @escaping (ProductDescription) -> Void) {
        
        ApiManager.shared.fetchCall(url: "\(Endpoint.productDescriptionEndpoint)\(id)/description") { response in
            guard let data = response else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let result = try decoder.decode(ProductDescription.self, from: data)
                onSuccess(result)
            } catch {
                print(String(describing: error))
            }
        } onError: { error in
            print(String(describing: error))
        }
    }
}
