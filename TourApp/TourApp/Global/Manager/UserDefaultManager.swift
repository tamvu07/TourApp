//
//  UserDefaultManager.swift
//  TourApp
//
//  Created by Vu Minh Tam on 8/10/21.
//

import UIKit

let KEY_API_TOKEN = "KeyAPIToken"

class UserDefaultManager: UserDefaults {
    
    fileprivate struct Constants {
        static let shared = UserDefaultManager()
    }
    
    open class var shared: UserDefaultManager {
        return Constants.shared
    }
    
    func isSignedIn() -> Bool {
        return apiToken().count > 0
    }
    
    func apiToken() -> String {
        let userDefaults = UserDefaults.standard
        if let token = userDefaults.value(forKey: KEY_API_TOKEN) as? String {
            return token
        }
        return ""
    }
}

