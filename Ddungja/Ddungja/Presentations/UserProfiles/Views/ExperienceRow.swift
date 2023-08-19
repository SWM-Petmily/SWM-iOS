//
//  ExperienceRow.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/08.
//

import SwiftUI

struct ExperienceRow: View {
    
    let id: String

    @State private(set) var species: String
    @State private(set) var year: String
    @State private(set) var month: String
    @State private(set) var isDropdownOpen = false
    
    var viewModel: UserProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("반려동물 종")
                    .applySubtitle(color: .mainTextColor)
                
                Spacer()
                    
                Button {
                    withAnimation {
                        if let index = viewModel.experienceArray.firstIndex(where: { $0.id == id }) {
                            viewModel.experienceArray.remove(at: index)
                        }
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                }
                .padding()
            }
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("품종을 입력하세요", text: $species)
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
                DropdownView(options: dogOptions) { option in
                    if let index = viewModel.experienceArray.firstIndex(where: { $0.id == id }) {
                        species = option.value
                        viewModel.experienceArray[index].species = option.value
                    }
                }
            }
            
            Text("양육기간")
                .applySubtitle(color: .mainTextColor)
            
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $year)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            
                        Spacer()
                        
                        Text("년")
                    }
                    .padding()
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $month)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            
                        Spacer()
                        
                        Text("개월")
                    }
                    .padding()
                }
            }
        }
    }
}
