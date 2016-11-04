//
//  AppDelegate.swift
//  Tsurunoko
//
//  Created by Arlo Armstrong on 10/7/16.
//  Copyright © 2016 Arlo Armstrong. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

struct ApplicationDidFinishLaunching: Action {

    let application: UIApplication
    let launchOptions: [UIApplicationLaunchOptionsKey: Any]?
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var mainStore = AppStore(
        reducer: AppReducer(),
        state: nil,
        middleware: [
            loggingMiddleware,
        ]
    )
    var router: Router<AppState>!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let rootRouter = Launch.Router(store: mainStore)
        router = Router(store: mainStore, rootRoutable: rootRouter) { state in
            state.navigationState
        }

        mainStore.dispatch(ApplicationDidFinishLaunching(application: application, launchOptions: launchOptions))

//        let route = ["Main", "Market", "ProductGroup", "Product"]
//        mainStore.dispatch(SelectProductGroup(identifier: "cheese"))
//        mainStore.dispatch(SelectProduct(identifier: "cheese1"))
//        mainStore.dispatch(SetRouteAction(route, animated: false))

//        let route = ["Main", "Cart"]
//        mainStore.dispatch(ChangeProductQuantity.set(to: 1, productID: "cheese1"))
//        mainStore.dispatch(ChangeProductQuantity.set(to: 2, productID: "cheese2"))
//        mainStore.dispatch(ChangeProductQuantity.set(to: 3, productID: "cheese3"))
//        mainStore.dispatch(SetRouteAction(route, animated: false))

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

