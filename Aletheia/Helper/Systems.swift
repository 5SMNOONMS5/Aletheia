//
//  Aletheia
//
//  Created by Stephen Chen on 27/1/2017.
//  Copyright © 2018 stephenchen. All rights reserved.
//

import UIKit

/// Provide offen usage relevant system functions
public struct ALSystems {
    
    /// 快速拿到值從Plist檔案
    ///
    /// - Parameter key: key in info.plist
    /// - Returns:       value from key in info.plist
    public static func getValueFromPlist(key: String) -> Any? {
        return Bundle.main.object(forInfoDictionaryKey: key)
    }
    
    /// App 當前的版本
    public static let appVersion: String? = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    
    /// App Build 的版號
    public static let appBuildNumber: String? = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    
    /// App 的 BundleIdentifier
    public static let appBundleIdentifier: String = Bundle.main.bundleIdentifier ?? "No Identifier"
    
    /// An alphanumeric string that uniquely identifies a device to the app’s vendor.
    public static let deviceID: String? = UIDevice.current.identifierForVendor?.uuidString
   
    /// Open application setting page
    public static func openSetting() -> Void {
        if let aUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(aUrl, options: [:], completionHandler: nil)
        }
    }
}

