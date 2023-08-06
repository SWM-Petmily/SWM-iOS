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
    private let info: RegisteredPetVO
    
    @State private var petType = ""
    @State private var petName = ""
    @State private var region = ""
    @State private var gender = Gender.male.rawValue
    @State private var neutered = Neutered.yes.rawValue
    @State private var year = ""
    @State private var month = ""
    
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
        }
        .padding()
        .onAppear {
            petType = info.petType
            petName = info.petName
            gender = info.petGender
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
            
            TextField("", text: $petType)
                .modifier(PlaceholderStyle(showPlaceHolder: petType.isEmpty, placeholder: "품종을 입력해주세요."))
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
            
            TextField("", text: $petName)
                .modifier(PlaceholderStyle(showPlaceHolder: petName.isEmpty, placeholder: "이름을 입력해주세요."))
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
            
            TextField("", text: $region)
                .modifier(PlaceholderStyle(showPlaceHolder: region.isEmpty, placeholder: "지역을 입력해주세요."))
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
    
    private var genderButton: some View {
        VStack(alignment: .leading) {
            Text("성별")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            CustomLazyVGrid(col: 2, spacing: 10) {
                Button("남아") {
                    gender = Gender.male.rawValue
                }
                .buttonStyle(RadioButtonMain(status: gender, buttonState: Gender.male.rawValue))
                
                Button("여아") {
                    gender = Gender.female.rawValue
                }
                .buttonStyle(RadioButtonMain(status: gender, buttonState: Gender.female.rawValue))
            }
        }
    }
    
    private var birthView: some View {
        VStack(alignment: .leading) {
            Text("반려동물 출생일")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            CustomLazyVGrid(col: 2, spacing: 10) {
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
                        TextField("", text: $month)
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
                    neutered = Neutered.yes.rawValue
                }
                .buttonStyle(RadioButtonMain(status: neutered, buttonState: Neutered.yes.rawValue))
                
                Button("무") {
                    neutered = Neutered.no.rawValue
                }
                .buttonStyle(RadioButtonMain(status: neutered, buttonState: Neutered.no.rawValue))
            }
        }
    }
    
    private var registerButton: some View {
        Button {
            
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

extension PetInfoView {
    enum Gender: String {
        case male = "MALE"
        case female = "FEMALE"
    }
    
    enum Neutered: String{
        case yes = "YES"
        case no = "NO"
    }
}
