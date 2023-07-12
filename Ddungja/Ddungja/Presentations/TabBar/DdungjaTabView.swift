//
//  DdungjaTabView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct DdungjaTabView: View {
    private let viewResolver: ViewResolverProtocol
    @State private var navigationPath = NavigationPath()
    
    init(viewResolver: ViewResolverProtocol) {
        self.viewResolver = viewResolver
    }
    
    public var body: some View {
        NavigationStack(path: $navigationPath) {
            
            
            TabView {
                HomeView()
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
                    
                RegisterView()
                    .tabItem {
                        Image(systemName: "plus.app")
                            .environment(\.symbolVariants, .none)
                        Text("등록")
                    }
                
                viewResolver.resolveView(UserProfileView.self)
                    .tabItem {
                        Image(systemName: "person.circle")
                            .environment(\.symbolVariants, .none)
                        Text("마이페이지")
                    }
            }
            .tint(Color.main)
        }
    }
}
