//
//  View + Extension.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/09.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
