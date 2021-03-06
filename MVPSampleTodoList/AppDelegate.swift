//
//  AppDelegate.swift
//  MVPSampleTodoList
//
//  Created by kosuke sakai on 2021/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 表示用にUserDefaultsに初期値持たせておく
        UserDefaults.standard.register(defaults: ["TodoItems": ["Item1",
                                                                "Item2",
                                                                "Item3",
                                                                "Item4",
                                                                "Item5"]])
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! TodoListViewController
        let model = TodoModel()
        let presenter = TodoListPresenter(view: view, model: model)
        
        view.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

