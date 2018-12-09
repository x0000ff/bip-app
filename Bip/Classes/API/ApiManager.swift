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
class ApiManager {
    
    //--------------------------------------------------------
    static let shared = ApiManager()
    
    //--------------------------------------------------------
    private init(){}
    
    //--------------------------------------------------------
    func load(cardNumber: String, completion: ((NetworkRequestResult<StatusResponse>) -> Void)?) {
        
        let endpoint = Endpoint.getBalance(cardNumber: cardNumber)
        let url = endpoint.url
        
        let task = URLSession.shared.dataTask(with: url) { (responseData, response, responseError) in
            
            DispatchQueue.main.async {
                
                if let error = responseError {
                    completion?(.failure(error))
                    return
                }
                
                if let jsonData = responseData {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let status = try decoder.decode(StatusResponse.self, from: jsonData)
                        completion?(.success(status))
                    } catch {
                        completion?(.failure(error))
                    }
                    
                    return
                }
                
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                completion?(.failure(error))
            }
        }
        
        task.resume()
    }
    
    //--------------------------------------------------------
}

//############################################################

