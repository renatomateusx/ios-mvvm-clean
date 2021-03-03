//
//  APIEnvironment.swift
//  CleanArchViewCode
//
//  Created by Renato Mateus on 02/03/21.
//

import Foundation

enum Environment {
    case development
    case staging
    case production
    
    func baseURL() -> String {
        return "https://\(subdomain()).\(domain())"
    }
    
    func domain()-> String {
        switch self {
        case .development:
            return "unsplash.com"
        case .staging:
            return "sunsplash.com"
        case .production:
            return "unsplash.com"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api"
        }
    }
    
    func route() -> String {
        return "/api/v1"
    }
}
