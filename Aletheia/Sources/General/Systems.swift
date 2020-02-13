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
    /// - Return:       value from key in info.plist
    public static func getValueFromPlist(key: String) -> Any? {
        return Bundle.main.object(forInfoDictionaryKey: key)
    }
    
    /// App 當前的版本
    public static let getAppVersion: String? = getValueFromPlist(key: "CFBundleShortVersionString") as? String
    
    /// App Build 的版號
    public static let getAppBuildNumber: String? = getValueFromPlist(key: "CFBundleVersion") as? String
    
    /// App 的 BundleIdentifier
    public static let getAppBundleID: String? = Bundle.main.bundleIdentifier
    
    /// An alphanumeric string that uniquely identifies a device to the app’s vendor.
    public static let getDeviceID: String? = UIDevice.current.identifierForVendor?.uuidString
   
    /// Open application setting page
    @available(iOS 10.0, *)
    public static func doOpenSetting() -> Void {
        if let aUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(aUrl, options: [:], completionHandler: nil)
        }
    }
}

