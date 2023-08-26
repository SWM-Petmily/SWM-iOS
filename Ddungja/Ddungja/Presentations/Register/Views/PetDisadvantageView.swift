//
//  PetDisadvantageView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/07.
//

import SwiftUI

struct PetDisadvantageView: View {
    @StateObject private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("소중한 반려동물과 함께 행복한 시간을 만들기 위해 주의할 점들을 적어주세요!")
                    .applyBigTitle(color: .mainTextColor)
                
                Text("반려동물이 싫어하는 것, 사육방법, 주의할 점을 적어주시면 입양자가 더 잘 키울 수 있어요!!")
                    .applySubhead(color: .disabledTextColor)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    VStack(alignment: .trailing) {
                        TextField("재파양을 막기 위해서 단점들 또한 상세하게 적어주세요!!", text: $viewModel.disAdvantage, axis: .vertical)
                            .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                            .padding()
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.buttonBackground, lineWidth: 2)
                            )
                            .onTapGesture { endTextEditing() }
                        
                        Text("\(viewModel.disAdvantage.count) / 1000")
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
            }.padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
        }
        
        Button {
            viewModel.push(.petCost)
        } label: {
            Text("등록 4/6")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}
