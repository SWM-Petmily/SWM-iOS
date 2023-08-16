//
//  DropDownOption.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import Foundation

struct DropdownOption: Hashable {
    let key: String
    let value: String

    static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}
