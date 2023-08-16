//
//  DropDown.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import SwiftUI

struct DropdownView: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: onOptionSelected)
                }
            }
        }
        .frame(height: 300)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
