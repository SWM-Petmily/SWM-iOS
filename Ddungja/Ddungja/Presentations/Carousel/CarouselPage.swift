//
//  CarouselPage.swift
//  Ddungja
//
//  Created by 오승기 on 2023/10/06.
//

import SwiftUI

struct CarouselPage: Identifiable, Hashable {
    var id: UUID = .init()
    var name: String
    var title: String
    var subTitle: String
}

