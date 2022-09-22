//
//  Top20Model.swift
//  JobReadyMeli
//
//  Created by Cristian Emmanuel Rivero on 13/09/2022.
//

import Foundation

struct TopTwentyModel: Codable {
    let content: [Content]
}

struct Content: Codable {
    let id: String
}



