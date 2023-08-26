//
//  PetInfoView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/06.
//

import SwiftUI
import PhotosUI

struct PetInfoView: View {
    @StateObject private var viewModel: RegisterViewModel
    @StateObject private var keyboardHandler = KeyboardHandler()
    
    private let info: RegisteredPetVO
    
    init(viewModel: RegisterViewModel, info: RegisteredPetVO) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.info = info
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20){
                photoView
                petTypeView
                petNameView
                birthView
                regionView
                genderButton
                neuteredButton
            }
            .padding(.bottom, keyboardHandler.keyboardHeight)
        }
        .padding()
        .onAppear {
            viewModel.petType = info.petType
            viewModel.petName = info.petName
            viewModel.gender = info.petGender
            viewModel.neutered = info.petNeutered
        }
        
        registerButton
    }
}

extension PetInfoView {
    private var photoView: some View {
        ScrollView(.horizontal) {
            HStack {
                PhotoPickerView(viewModel: viewModel)
                    .frame(width: 108, height: 108)
                ForEach(viewModel.images, id: \.self) { imageData in
                    if let image = UIImage(data: imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 108, height: 108)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .contentShape(Rectangle())
                    }
                }
            }
        }
    }
    
    private var petTypeView: some View {
        VStack(alignment: .leading) {
            Text("품종")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            TextField("", text: $viewModel.petType)
                .modifier(PlaceholderStyle(showPlaceHolder: viewModel.petType.isEmpty, placeholder: "품종을 입력해주세요."))
                .font(.system(size: 16))
                .foregroundColor(Color.mainText)
                .bold()
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .frame(height: 30)
                .padding()
                .background(Color.mainBackground)
                .cornerRadius(10)
                .onTapGesture { endTextEditing() }
        }
    }
    
    private var petNameView: some View {
        VStack(alignment: .leading) {
            Text("반려동물 이름")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            TextField("", text: $viewModel.petName)
                .modifier(PlaceholderStyle(showPlaceHolder: viewModel.petName.isEmpty, placeholder: "이름을 입력해주세요."))
                .font(.system(size: 16))
                .foregroundColor(Color.mainText)
                .bold()
                .frame(maxWidth: .infinity)
                .lineLimit(1)
                .frame(height: 30)
                .padding()
                .background(Color.mainBackground)
                .cornerRadius(10)
                .onTapGesture { endTextEditing() }
        }
    }
    
    private var regionView: some View {
        VStack(alignment: .leading) {
            Text("지역")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            RegionView(viewModel: viewModel)
        }
    }
    
    private var genderButton: some View {
        VStack(alignment: .leading) {
            Text("성별")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            CustomLazyVGrid(col: 2, spacing: 10) {
                Button("남아") {
                    viewModel.gender = Gender.male.rawValue
                }
                .buttonStyle(RadioButtonMain(status: viewModel.gender, buttonState: Gender.male.rawValue))
                
                Button("여아") {
                    viewModel.gender = Gender.female.rawValue
                }
                .buttonStyle(RadioButtonMain(status: viewModel.gender, buttonState: Gender.female.rawValue))
            }
        }
    }
    
    private var birthView: some View {
        VStack(alignment: .leading) {
            Text("반려동물 출생일")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $viewModel.year)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .onTapGesture {
                                endTextEditing()
                            }
                            
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
                        TextField("", text: $viewModel.month)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .onTapGesture {
                                endTextEditing()
                            }
                            
                        Spacer()
                        
                        Text("월")
                    }
                    .padding()
                }
            }
        }
    }
    
    private var neuteredButton: some View {
        VStack(alignment: .leading) {
            Text("중성화 여부")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            CustomLazyVGrid(col: 2, spacing: 10) {
                Button("유") {
                    viewModel.neutered = Neutered.yes.rawValue
                }
                .buttonStyle(RadioButtonMain(status: viewModel.neutered, buttonState: Neutered.yes.rawValue))
                
                Button("무") {
                    viewModel.neutered = Neutered.no.rawValue
                }
                .buttonStyle(RadioButtonMain(status: viewModel.neutered, buttonState: Neutered.no.rawValue))
            }
        }
    }
    
    private var registerButton: some View {
        Button {
            viewModel.push(.adoptionReason)
        } label: {
            Text("등록 1/6")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}
