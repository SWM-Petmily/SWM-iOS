//
//  HomeView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct HomeScene: View {
    let arr = [1,2,3,4,5,6,7,8]
    var body: some View {
        CustomLazyVGrid(col: 2, spacing: 10) {
            
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
    }
}
