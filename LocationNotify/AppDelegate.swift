//
//  AppDelegate.swift
//  LocationNotify
//
//  Created by mak on 2019/09/08.
//  Copyright © 2019 example.dev. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
//        let interval:TimeInterval = 10
        application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            if error != nil {
                return
            }
            
            if granted {
                print("Allowed")
            } else {
                print("Didn't allowed")
            }
        }
//        let myNotification: UILocalNotification = UILocalNotification()
////        // タイトルを設定
//        myNotification.alertTitle = "message"
////        // メッセージを設定
//        myNotification.alertBody = "detailStr"
////        // Timezoneを設定をする.
//////        myNotification.timeZone = TimeZone.
////        // Notificationを表示する.
//        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
        // バックグラウンドフェッチ結果を通知
        completionHandler(UIBackgroundFetchResult.newData)
        
        if let viewController = window?.rootViewController as? ViewController {
            viewController.updateTime()
            viewController.setNotification()
        }
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

