//
//  RegionView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import SwiftUI

struct RegionView: View {
    let viewModel: UserProfileViewModel
    @State private var region = ""
    @State private var isDropdownOpen = false
    
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
                        TextField("지역을 선택해주세요", text: $region)
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
                    region = option.value
                    viewModel.region = option.value
                }
            }
        }
    }
}
