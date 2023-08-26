//
//  RegionView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import SwiftUI

protocol RegionInterface: ObservableObject {
    var region: String { get set }
    func updateRegion(_ newRegion: String)
}

struct RegionView<T: RegionInterface>: View {
    @StateObject private var viewModel: T
    @State private var isDropdownOpen = false
    
    init(viewModel: T) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("지역을 선택해주세요", text: $viewModel.region)
                            .disabled(true)
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                    }
                    .padding()
                }
            }
            .onTapGesture {
                withAnimation {
                    isDropdownOpen.toggle()
                }
            }
            
            if isDropdownOpen {
                DropdownView(options: regionOptions) { option in
                    viewModel.updateRegion(option.value)
                    withAnimation {
                        isDropdownOpen.toggle()
                    }
                }
            }
        }
    }
}
