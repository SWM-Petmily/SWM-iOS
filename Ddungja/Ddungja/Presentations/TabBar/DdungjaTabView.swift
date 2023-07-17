//
//  DdungjaTabView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct DdungjaTabView: View {
    private var coordinator: CoordinatorProtocol
    private let viewResolver: ViewResolverProtocol
    @State private var navigationPath = NavigationPath()
    
    init(coordinator: CoordinatorProtocol, viewResolver: ViewResolverProtocol) {
        self.coordinator = coordinator
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

                viewResolver.resolveView(MyPageVIew.self)
                    .tabItem {
                        Image(systemName: "person.circle")
                            .environment(\.symbolVariants, .none)
                        Text("마이페이지")
                    }
            }
            .tint(Color.main)
            .navigationDestination(for: Page.self) { page in
                page.getView(coordinator: coordinator, viewResolver: viewResolver)
            }
        }
        .onReceive(coordinator.pathPublisher) { navigationPath in
            self.navigationPath = navigationPath
        }
    }
}
