//
//  StatusResponse.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

//############################################################
struct StatusResponse: Codable {
    let error: String?
    let status: Status?
}

//############################################################
