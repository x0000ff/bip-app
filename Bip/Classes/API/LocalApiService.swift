//
//  LocalApiService.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/9/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

// STUBApiService ???
//############################################################
class LocalApiService: APIService {
    
    //--------------------------------------------------------
    func load(cardNumber: String, completion: ((Result<StatusResponse>) -> Void)?) {
        
        let result = (cardNumber == "") ? faulureResult() : successResult()
        completion?(result)
    }
    
    //--------------------------------------------------------
}

//############################################################
extension LocalApiService {
    
    //--------------------------------------------------------
    func successResult() -> Result<StatusResponse> {
        let status = Status(number: "1234567890", message: "Ok!", valid: true, balance: 123, date: "12-24-5678")
        let response = StatusResponse(error: nil, status: status)
        return Result.success(response)
    }
    
    //--------------------------------------------------------
    func faulureResult() -> Result<StatusResponse> {
        let error = NSError(domain: "Some Domain",
                            code: 12,
                            userInfo: [NSLocalizedDescriptionKey: "Something bad happend..."])
        return Result<StatusResponse>.failure(error as Error)
    }

    //--------------------------------------------------------
}

//############################################################
