//
//  HomeView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct HomeScene: View {
    var viewModel: HomeViewModel
    
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
