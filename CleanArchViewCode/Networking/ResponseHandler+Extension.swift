//
//  ResponseHandler+Extension.swift
//  CleanArchViewCode
//
//  Created by Renato Mateus on 02/03/21.
//

import Foundation

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
}

extension ResponseHandler {
    func defaultParseResponse<T: Codable> (data: Data, response: HTTPURLResponse) throws -> T {
        let jsonDecoder = JSONDecoder()
        do {
            let body = try jsonDecoder.decode(T.self, from: data)
            if response.statusCode == 200 {
                return body
            }
            else{
                throw ServiceError(httpStatus: response.statusCode, message: "Unknow Error")
            }
        }
        catch {
            throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription)
        }
    }
}
