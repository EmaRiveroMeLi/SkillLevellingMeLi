//
//  Endpoints.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 18/09/2022.
//

import Foundation

struct Endpoint {
    static let categoryEndpoint: String = "https://api.mercadolibre.com/sites/MLA/domain_discovery/search?limit=1&q="
    static let top20Endpoint: String = "https://api.mercadolibre.com/highlights/MLA/category/"
    static let productDetailEndpoint: String = "https://api.mercadolibre.com/items?ids="
    static let productDescriptionEndpoint: String = "https://api.mercadolibre.com/items/"
    static let navigationWeb: String = "https://www.mercadolibre.com.ar/"
}
