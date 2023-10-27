//
//  DdungjaApp.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import Swinject
import Firebase

@main
struct DdungjaApp: App {
    
    private let injector: Injector
    private let viewResolver: ViewResolver
    @ObservedObject private var coordinator: Coordinator
    @State private var showLaunchView = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        injector = DependencyInjector(container: Container())
        viewResolver = ViewResolver(injector: injector)
        coordinator = Coordinator(.login, injector)
        injector.assemble([DomainAssembly(),
                           DataAssembly(),
                           PresentationAssembly(coordinator: coordinator)
                          ])
    
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_API_LOGIN_KEY"] ?? ""
    
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color.main)
        if KeyChainManager.isPossibleAutoLogin {
            coordinator.push(.tapBar)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack(path: $coordinator.path) {
                    coordinator.initScene()
                        .navigationDestination(for: Page.self) { page in
                            coordinator.make(page)
                        }
                }
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2)
            }
        }
    }
}
