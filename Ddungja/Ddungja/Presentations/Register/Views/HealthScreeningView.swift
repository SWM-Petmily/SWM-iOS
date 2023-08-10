//
//  HealthScreeningView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI
import PhotosUI

struct HealthScreeningView: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let postId: Int
    
    init(viewModel: PetCertificationViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("건강검진 정보 인증 Tip!")
                .bold()
                .applyTitle(color: .mainTextColor)
            
            Text("** 건강검진 결과를 사진으로 등록해주세요!")
                .applySubhead(color: .mainTextColor)
            
            ScrollView(.horizontal) {
                HStack {
                    PhotoPickerView1(viewModel: viewModel)
                        .frame(width: 108, height: 108)
                    ForEach(viewModel.healthInfoImages, id: \.self) { imageData in
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
        .padding()
        
        Spacer()
        
        Button {
            viewModel.registerPetHealthInfo(postId)
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

/*
 BaseViewModel을 채택해서 PhotoPickerView재사용하도록 수정할 예정
 */
struct PhotoPickerView1: View {
    @ObservedObject private var viewModel: PetCertificationViewModel
    @State private var selectedItem: [PhotosPickerItem] = []
    
    init(viewModel: PetCertificationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, maxSelectionCount: 5, selectionBehavior: .ordered, matching: .images, photoLibrary: .shared()) {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .strokeBorder(Color.main, lineWidth: 1)
                    .background(.white)
                
                VStack {
                    Image(systemName: "photo")
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.mainText)
                    
                    Text("사진등록하기")
                        .bold()
                        .applySubtitle(color: .mainTextColor)
                }
            }
        }
        .onChange(of: selectedItem) { selectedItems in
            for (idx, item) in selectedItems.enumerated() {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        viewModel.healthInfoImages.insert(data, at: idx)
                    }
                }
            }
        }
    }
}
