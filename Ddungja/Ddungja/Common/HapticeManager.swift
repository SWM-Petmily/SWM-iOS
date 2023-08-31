//
//  HapticeManager.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/26.
//

import Foundation
import UIKit

final class HapticeManager {
    static let shared = HapticeManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
