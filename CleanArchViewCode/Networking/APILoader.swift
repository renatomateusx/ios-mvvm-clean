//
//  APILoader.swift
//  CleanArchViewCode
//
//  Created by Renato Mateus on 02/03/21.
//

import Foundation

class APILoader<T: APIHandler> {
    let apiRequest: T
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, Error?)->()){
        if let urlRequest = apiRequest.makeRequest(from: requestData){
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                    return completionHandler(nil, error)
                }
                do {
                    let parsedReponse = try self.apiRequest.parseResponse(data: data, response: httpResponse)
                    completionHandler(parsedReponse, nil)
                }
                catch {
                    completionHandler(nil, error)
                }
            }.resume()
        }
    }
}
