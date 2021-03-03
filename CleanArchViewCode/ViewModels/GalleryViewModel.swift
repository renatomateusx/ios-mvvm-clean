//
//  GalleryViewModel.swift
//  CleanArchViewCode
//
//  Created by Renato Mateus on 02/03/21.
//

import Foundation

class GalleryViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (GalleryModel?, Error?)-> ()){
        let request = GalleryAPI()
        let apiLoader = APILoader(apiRequest: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            }
            else {
                completion(model, nil)
            }
        }
    }
}
