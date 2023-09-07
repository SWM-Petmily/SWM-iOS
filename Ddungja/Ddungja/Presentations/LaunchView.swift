//
//  LaunchView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/09/07.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText = "PETMILY".map{ String($0) }
    @State private var showLoadingText = false
    @State private var counter = 0
    @State private var loop = 0
    @Binding var showLaunchView: Bool
    
    private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(hex: "FE735C")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Image("Logo")
                    .resizable()
                    .frame(width: 190, height: 150)
                
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.custom("BalooDa-Regular", size: 42))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .offset(y: counter == index ? -18 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if(counter == lastIndex) {
                    counter = 0
                    loop += 1
                    
                    if loop >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}
