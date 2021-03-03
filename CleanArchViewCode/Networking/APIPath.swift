//
//  APIPath.swift
//  CleanArchViewCode
//
//  Created by Renato Mateus on 02/03/21.
//

import Foundation
#if DEBUG
    let environment = Environment.development
#else
    let environment = Environment.production
#endif

let baseURL = environment.baseURL()

struct Path {
    var gallery: String { return "\(baseURL)/search/photos" }
}
