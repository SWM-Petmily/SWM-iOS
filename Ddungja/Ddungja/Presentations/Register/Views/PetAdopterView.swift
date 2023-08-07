//
//  PetAdopterView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/07.
//

import SwiftUI

struct PetAdopterView: View {
    @StateObject private var viewModel: RegisterViewModel
    @State private var adopter = ""
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
                Text("어떤 입양자를 구하고 싶은지 말씀해주세요!")
                    .applyBigTitle(color: .mainTextColor)
                
                Text("떠나는 반려동물이 좋은 주인에게 갈 수 있도록 상세하게 적어주세요!!")
                    .applySubhead(color: .disabledTextColor)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    VStack(alignment: .trailing) {
                        TextField("나의 반려동물이 어떤 주인에게 가면 좋을지 상세하게 작성해주세요", text: $adopter, axis: .vertical)
                            .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                            .padding()
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.buttonBackground, lineWidth: 2)
                            )
                            .onTapGesture { endTextEditing() }
                        
                        Text("\(adopter.count) / 1000")
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                
            }.padding()
        }
        
        Button {
            let vo = PetPostVO(mainCategory: petPostVO.mainCategory, subCategory: petPostVO.subCategory, name: petPostVO.name, region: petPostVO.region, gender: petPostVO.gender, birth: petPostVO.birth, neutered: petPostVO.neutered, money: petPostVO.money, reason: petPostVO.reason, advantage: petPostVO.advantage, disadvantage: petPostVO.disadvantage, averageCost: petPostVO.averageCost, adopter: adopter, status: petPostVO.status, diseases: petPostVO.diseases, isRegistered: petPostVO.isRegistered)
            
            viewModel.registerPost(vo: vo, images: image)
        } label: {
            Text("작성완료")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}
