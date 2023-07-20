//
//  Text + Extension.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/20.
//

import SwiftUI

extension Text {
    func makeAcceptButton() -> some View {
        self.applyInner(color: .acceptText)
            .bold()
            .frame(maxWidth: .infinity, minHeight: 54)
            .background(Color.acceptButton)
            .cornerRadius(15)
    }
    
    func makeRejectButton() -> some View {
        self.applyInner(color: .rejectText)
            .bold()
            .frame(maxWidth: .infinity, minHeight: 54)
            .background(Color.rejectButton)
            .cornerRadius(15)
    }
}
