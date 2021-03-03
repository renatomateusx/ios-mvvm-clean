//
//  RequestHandler+Extension.swift
//  CleanArchViewCode
//
//  Created by Renato Mateus on 02/03/21.
//

import Foundation

extension RequestHandler {
    func set(parameters: [String: Any], urlRequest: inout URLRequest){
        if parameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []){
                urlRequest.httpBody = jsonData
            }
        }
    }
    
    func setQueryParams(parameters: [String: Any], url: URL)-> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map{element in URLQueryItem(name: element.key, value: String(describing: element.value))}
        return components?.url ?? url
    }
    func setDefaultHeaders(request: inout URLRequest){
        request.setValue(Constants.APIHeaders.contentTypeValue, forHTTPHeaderField: Constants.APIHeaders.kContentType)
    }
}
