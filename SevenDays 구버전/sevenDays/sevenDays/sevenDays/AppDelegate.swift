//
//  AppDelegate.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//// saving Data : 데이터 로컬에 저장하기
//    func saveToFile() {
//        let documentsDirectory =
//          FileManager.default.urls(for: .documentDirectory,
//          in: .userDomainMask).first!
//        let archiveURL =
//          documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
//        let propertyListEncoder = PropertyListEncoder()
//        let encodedNotes = try? propertyListEncoder.encode(player)
//        try? encodedNotes?.write(to: archiveURL,options: .noFileProtection)
//    }
//// saving Data : 데이터 로컬에서 불러오기
//    func loadFromFile() {
//        let documentsDirectory =
//          FileManager.default.urls(for: .documentDirectory,
//          in: .userDomainMask).first!
//        let archiveURL =
//          documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
//        let propertyListDecoder = PropertyListDecoder()
//        if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? propertyListDecoder.decode(User.self, from:retrievedNotesData) {
//            print(decodedNotes)
//            player = decodedNotes
//        }
//    }

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //sleep(3)
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

