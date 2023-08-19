//
//  DropDownRow.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import SwiftUI

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = onOptionSelected {
                onOptionSelected(option)
            }
        }) {
            HStack {
                Text(option.value)
                    .font(.system(size: 25))
                    .foregroundColor(.mainText)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
