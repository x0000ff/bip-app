//
//  Status.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

//############################################################
struct Status: Codable {
    let number: String
    let message: String
    let valid: Bool
    let balance: Int
    let date: String
}

//############################################################
