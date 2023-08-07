//
//  AdoptionReasonView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/06.
//

import SwiftUI

struct AdoptionReasonView: View {
    @StateObject private var viewModel: RegisterViewModel
    @State private var reason = ""
    private var petPostVO: PetPostVO
    private var image: [Data]
    
    init(viewModel: RegisterViewModel, petPostVO: PetPostVO, image: [Data]) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.petPostVO = petPostVO
        self.image = image
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("반려동물을 분양하는 이유를 알려주세요!")
                    .applyBigTitle(color: .mainTextColor)
                
                Text("반려동물을 분양하는 이유를 알려줘야 입양자가 잘 키울 수 있어요! 만약 질병을 가지고 있는 경우 알려주세요~")
                    .applySubhead(color: .disabledTextColor)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    VStack(alignment: .trailing) {
                        TextField("분양하는 이유가 상세할수록 분양확률이 올라가요!!", text: $reason, axis: .vertical)
                            .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                            .padding()
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.buttonBackground, lineWidth: 2)
                            )
                            .onTapGesture { endTextEditing() }
                        
                        Text("\(reason.count) / 1000")
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                
            }.padding()
        }
        
        Button {
            viewModel.push(.petAdvantage(post: PetPostVO(mainCategory: petPostVO.mainCategory, subCategory: petPostVO.subCategory, name: petPostVO.name, region: petPostVO.region, gender: petPostVO.gender, birth: petPostVO.birth, neutered: petPostVO.neutered, money: petPostVO.money, reason: reason, advantage: "", disadvantage: "", averageCost: "", adopter: "", status: petPostVO.status, diseases: petPostVO.diseases, isRegistered: petPostVO.isRegistered), images: image))
        } label: {
            Text("등록 2/6")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}
