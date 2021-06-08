//
//  AppDelegate.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//        loadFromFile()
        loadJson(fromURLString: prologueJsonURL) { (result) in
              switch result {
              case .success(let data):
                parse(jsonData: data, targetEpisode: 0)
              case .failure(let error):
                  print(error)
              }
            if (player.currentEpisodes[0].storyBlocks.isEmpty)
            {
                print("프롤로그 챕터가 비었습니다")
            }
            else
            {
                print("프롤로그 챕터가 들어있습니다")
            }
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

