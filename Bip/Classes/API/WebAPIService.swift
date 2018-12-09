//
//  ApiManager.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import UIKit

//############################################################
protocol APIService {
    func load(cardNumber: String, completion: ((Result<StatusResponse>) -> Void)?)
}

//############################################################
class WebAPIService: APIService {

    //--------------------------------------------------------
    func load(cardNumber: String, completion: ((Result<StatusResponse>) -> Void)?) {
        
        let endpoint = Endpoint.getBalance(cardNumber: cardNumber)
        let url = endpoint.url
        
        let task = URLSession.shared.dataTask(with: url) { (responseData, response, responseError) in
            
            DispatchQueue.main.async {
                
                if let error = responseError {
                    completion?(.failure(error))
                    return
                }
                
                guard let jsonData = responseData else {
                    let errorMessage = "Data was not retrieved from request"
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : errorMessage]) as Error
                    completion?(.failure(error))
                    return
                }
                
                let result = StatusResponseParser().parse(jsonData: jsonData)
                completion?(result)
            }
        }
        
        task.resume()
    }
    
    //--------------------------------------------------------
}

//############################################################

