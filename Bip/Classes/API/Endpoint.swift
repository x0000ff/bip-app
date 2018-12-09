//
//  Endpoint.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

//############################################################
enum HTTPMethod {
    case get, post, put, head, delete, options
}

//############################################################
enum Endpoint {

    //--------------------------------------------------------
    case getBalance(cardNumber: String)
    
    //--------------------------------------------------------
    var method: HTTPMethod {
        switch self {
        case .getBalance(_):
            return HTTPMethod.get
        }
    }
    
    //--------------------------------------------------------
    var base: String {
        switch self {
        case .getBalance(_):
            return "https://x-bip-api.herokuapp.com"
        }
    }
    
    //--------------------------------------------------------
    var path: String {
        switch self {
        case let .getBalance(cardNumber):
            return "/?card_number=\(cardNumber)"
        }
    }
    
    //--------------------------------------------------------
    var url: URL {
        switch self {
        case .getBalance(_):
            return URL(string: "\(base)\(path)")!
        }
    }
    
    //--------------------------------------------------------
}

//############################################################
