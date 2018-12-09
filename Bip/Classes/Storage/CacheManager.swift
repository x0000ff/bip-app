//
//  CacheManager.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

//############################################################
class CacheManager {

    //--------------------------------------------------------
    enum Key: String {
        case balance = "Balance"
        case cardNumber = "CardNumber"
    }
    
    //--------------------------------------------------------
    static let shared = CacheManager()
 
    //--------------------------------------------------------
    public var hasSavedData: Bool { return cardNumber != nil }
    
    //--------------------------------------------------------
    public var cardNumber: String? {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(cardNumber, forKey: Key.cardNumber.rawValue)
            defaults.synchronize()
        }
    }

    //--------------------------------------------------------
    public var balance: Int = 0 {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(balance, forKey: Key.balance.rawValue)
            defaults.synchronize()
        }
    }
    
    //--------------------------------------------------------
    private init(){
        load()
    }

    //--------------------------------------------------------
    private func load() {
        balance = UserDefaults.standard.integer(forKey: Key.balance.rawValue)
        cardNumber = UserDefaults.standard.string(forKey: Key.cardNumber.rawValue)
    }
    
    //--------------------------------------------------------
    public func clear() {
        balance = 0
        cardNumber = nil
    }

    //--------------------------------------------------------
}

//############################################################
