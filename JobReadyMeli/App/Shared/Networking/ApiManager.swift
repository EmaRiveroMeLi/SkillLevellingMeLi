//
//  Service.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 14/09/2022.
//

import Foundation
import Alamofire

class ApiManager {
    static let shared = ApiManager()
    
    func fetchCall(url: String, onSuccess: @escaping (Data?) -> Void) {
        AF.request(url, headers: AccessToken.headers).response { response in
            onSuccess(response.data)
        }
    }
}





