//
//  App.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/13/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import Foundation

//############################################################
protocol DependencyContainer {
    var apiService: APIService { get }
    var cacheManager: CacheManager { get }
}

//############################################################
final class DefaultDependencyContainer: DependencyContainer {
    
    //--------------------------------------------------------
    let apiService: APIService
    let cacheManager: CacheManager
    
    //--------------------------------------------------------
    init(apiService: APIService, cacheManager: CacheManager) {
        self.apiService = apiService
        self.cacheManager = cacheManager
    }

    //--------------------------------------------------------
}

//############################################################
