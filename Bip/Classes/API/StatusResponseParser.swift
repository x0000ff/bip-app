//
//  StatusResponseParser.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/9/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

//############################################################
class StatusResponseParser {

    //--------------------------------------------------------
    func parse(jsonData: Data) -> Result<StatusResponse> {
        
        let decoder = JSONDecoder()
        
        do {
            let status = try decoder.decode(StatusResponse.self, from: jsonData)
            return Result.success(status)
        } catch {
            return Result.failure(error)
        }
    }
    
    //--------------------------------------------------------
}

//############################################################
