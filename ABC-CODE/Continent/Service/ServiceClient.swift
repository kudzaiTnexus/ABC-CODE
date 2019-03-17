//
//  ServiceClient.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ServiceClient {
    func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void)
}

class ServiceClientImplementation: ServiceClient {
    
    func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        
        let trimmedString = urlString.trimmingCharacters(in: .whitespaces)
        
        guard let url = URL(string: trimmedString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                return completion(nil, error)
            }
            guard let responseData = data else {
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
}
