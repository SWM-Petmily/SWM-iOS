//
//  PetInfoRowView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import SwiftUI

struct PetInfoRowView: View {
    private var info: RegisteredPetVO
    
    init(info: RegisteredPetVO) {
        self.info = info
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text(info.petName)
                        .applyTitle(color: .mainTextColor)
                        .bold()
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.buttonBackground)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(5)
                    
                    HStack() {
                        HStack(alignment: .center) {
                            Text("품종")
                                .applySubtitle(color: .disabledTextColor)
                            Text(info.petType)
                                .applySubtitle(color: .mainTextColor)
                                .bold()
                        }
                        .padding([.leading, .trailing])
                        
                        Divider()
                            .frame(width: 1, height: 35)
                        
                        
                        HStack(alignment: .center) {
                            Text("성별")
                                .applySubtitle(color: .disabledTextColor)
                            Text(info.petGender)
                                .applySubtitle(color: .mainTextColor)
                                .bold()
                        }
                        .padding([.leading, .trailing])
                        
                        Divider()
                            .frame(width: 1, height: 35)
                        
                        HStack(alignment: .center) {
                            Text("중성화")
                                .applySubtitle(color: .disabledTextColor)
                            Text(info.petNeutered)
                                .applySubtitle(color: .mainTextColor)
                                .bold()
                        }
                        .padding([.leading, .trailing])
                    }
                }
                
                Divider()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.top)
            }
        }
        
    }
}
