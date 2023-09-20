//
//  GoogleAnalyticsUtil.swift
//  Ddungja
//
//  Created by 오승기 on 2023/09/20.
//

import Foundation
import UIKit
import FirebaseAnalytics
import FirebaseAnalyticsSwift

final class GoogleAnalyticsUtil {
    private let uuid: String
    private let version: String
    
    private init() {
        self.uuid = UUID().uuidString
        self.version = UIDevice.current.systemVersion
    }
    
    static let shared = GoogleAnalyticsUtil()
    
    func logScreenEvent(_ eventName: String, parameters: [String: Any]?) {
        var eventParams = parameters ?? [:]
        eventParams["UUID"] = uuid
        eventParams["OS_Version"] = version
        
        Analytics.logEvent(eventName, parameters: eventParams)
    }
}
