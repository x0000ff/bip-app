//
//  Services.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/9/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

import Foundation

protocol ServiceLocating {
    var apiService: APIService { get }
    var cacheManager: CacheManager { get }
}

final class ServiceLocator: ServiceLocating {

    var apiService: APIService = WebAPIService()
    var cacheManager: CacheManager = UserDefaultsCacheManager()
    
    public static let shared = ServiceLocator()
}
