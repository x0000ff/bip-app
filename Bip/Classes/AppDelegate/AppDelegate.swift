//
//  AppDelegate.swift
//  Bip
//
//  Created by Konstantin Portnov on 12/8/18.
//  Copyright © 2018 x0000ff. All rights reserved.
//

//############################################################
import UIKit

//############################################################
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //--------------------------------------------------------
    var window: UIWindow?

    //--------------------------------------------------------
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let dependencyContainer = DefaultDependencyContainer(apiService: LocalApiService(),
                                                             cacheManager: UserDefaultsCacheManager())

        window?.rootViewController = MainController(dependencyContainer: dependencyContainer)
        window?.makeKeyAndVisible()
        
        return true
    }

    //--------------------------------------------------------
}

//############################################################
