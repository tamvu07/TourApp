//
//  AppDelegate.swift
//  TourApp
//
//  Created by Vu Minh Tam on 8/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var flashWindow: UIWindow = {
        let fw = UIWindow.init(frame: UIScreen.main.bounds)
        let launchScreen = UIStoryboard.init(name: "FlashScreen", bundle: nil).instantiateInitialViewController() as? FlashScreenViewController
        fw.rootViewController = launchScreen
        return fw
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.flashWindow.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            let nav = InitiationNavigationController()
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()

            UIView.animate(withDuration: TimeInterval(0.5), animations: {
                self.flashWindow.alpha = 0
            }, completion: { done in
                self.flashWindow.removeFromSuperview()
            })
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

