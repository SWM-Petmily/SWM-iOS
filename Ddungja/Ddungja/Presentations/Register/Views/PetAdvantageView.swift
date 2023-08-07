//
//  PetAdvantageView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/07.
//

import SwiftUI

struct PetAdvantageView: View {
    @StateObject private var viewModel: RegisterViewModel
    @State private var advantage = ""
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
                Text("나의 반려동물을 자랑해주세요!")
                    .applyBigTitle(color: .mainTextColor)
                
                Text("반려동물의 매력, 좋아하는 것들을 적어주시면 입양자가 더 잘 키울 수 있어요!")
                    .applySubhead(color: .disabledTextColor)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    VStack(alignment: .trailing) {
                        TextField("반려동물을 자랑해보세요!!", text: $advantage, axis: .vertical)
                            .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                            .padding()
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.buttonBackground, lineWidth: 2)
                            )
                            .onTapGesture { endTextEditing() }
                        
                        Text("\(advantage.count) / 1000")
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                
            }.padding()
        }
        
        Button {
            viewModel.push(.petDisadvantage(post: PetPostVO(mainCategory: petPostVO.mainCategory, subCategory: petPostVO.subCategory, name: petPostVO.name, region: petPostVO.region, gender: petPostVO.gender, birth: petPostVO.birth, neutered: petPostVO.neutered, money: petPostVO.money, reason: petPostVO.reason, advantage: advantage, disadvantage: "", averageCost: "", adopter: "", status: petPostVO.status, diseases: petPostVO.diseases, isRegistered: petPostVO.isRegistered), images: image))
        } label: {
            Text("등록 3/6")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}
