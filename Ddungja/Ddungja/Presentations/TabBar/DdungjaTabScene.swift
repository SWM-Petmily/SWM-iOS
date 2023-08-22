//
//  DdungjaTabView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct DdungjaTabScene: View {
    
    private let home: HomeScene
    private let register: RegisterScene
    private let myPage: MyPageScene
    
    init(_ home: HomeScene, _ register: RegisterScene, _ myPage: MyPageScene) {
        self.home = home
        self.register = register
        self.myPage = myPage
    }
    
    var body: some View {
        TabView {
            home
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            
            InterestView()
                .tabItem {
                    
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, .none)
                    Text("관심")
                    
                }
            
            register
                .tabItem {
                    Image(systemName: "plus.app")
                        .environment(\.symbolVariants, .none)
                    Text("등록")
                }
            
            myPage
                .tabItem {
                    Image(systemName: "person.circle")
                        .environment(\.symbolVariants, .none)
                    Text("마이페이지")
                }
        }
        .tint(Color.main)
        .toolbar(.hidden)
    }
    
}
