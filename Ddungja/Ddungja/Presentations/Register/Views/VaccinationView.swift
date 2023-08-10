//
//  VaccinationView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI
import PhotosUI

struct VaccinationView: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let postId: Int
    
    init(viewModel: PetCertificationViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("예방접종 인증 Tip!")
                .bold()
                .applyTitle(color: .mainTextColor)
            
            Text("** 병원에 직접 방문하거나, 인투펫 등의 동물병원 내역 조회 서비스를 통한 백신 내역을 올려주세요!")
                .applySubhead(color: .mainTextColor)
            
            ScrollView(.horizontal) {
                HStack {
                    PhotoPickerView2(viewModel: viewModel)
                        .frame(width: 108, height: 108)
                    ForEach(viewModel.vaccineInfoImages, id: \.self) { imageData in
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
            viewModel.registerVaccineInfo(postId)
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

struct PhotoPickerView2: View {
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
                        viewModel.vaccineInfoImages.insert(data, at: idx)
                    }
                }
            }
        }
    }
}
