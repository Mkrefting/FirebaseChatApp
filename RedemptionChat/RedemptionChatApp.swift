//
//  RedemptionChatApp.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 14/05/2021.
//

import SwiftUI
import Firebase

@main
struct RedemptionChatApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StateController())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }

}
