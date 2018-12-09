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
protocol CacheManager {
    
    var hasSavedData: Bool { get }
    
    var cardNumber: String? { get set }
    var balance: Int { get set }
    func clear()
}

//############################################################
class UserDefaultsCacheManager: CacheManager {

    //--------------------------------------------------------
    enum Key: String {
        case balance = "Balance"
        case cardNumber = "CardNumber"
    }
    
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
    init(){
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
