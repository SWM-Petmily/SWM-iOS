//
//  PetCostView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/07.
//

import SwiftUI

struct PetCostView: View {
    @ObservedObject private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("반려동물을 키울 때 드는 평균 비용을 말씀해주세요")
                    .applyBigTitle(color: .mainTextColor)
                
                Text("사료비용, 병원비, 간식비 등에 대해 알려주시면 상대방의 결정에 도움을 줄 수 있어요")
                    .applySubhead(color: .disabledTextColor)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    VStack(alignment: .trailing) {
                        TextField("비용때문에 재파양되는 일이 없게 솔직하게 적어주세요", text: $viewModel.cost, axis: .vertical)
                            .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                            .padding()
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.buttonBackground, lineWidth: 2)
                            )
                            .onTapGesture { endTextEditing() }
                        
                        Text("\(viewModel.cost.count) / 1000")
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
            }
            .padding()
        }
        
        Button {
            viewModel.push(.petAdopter)
        } label: {
            Text("등록 5/6")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}
