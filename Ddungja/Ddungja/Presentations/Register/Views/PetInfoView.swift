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
    
    init(viewModel: RegisterViewModel, info: RegisteredPetVO) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.info = info
    }
    
    var body: some View {
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
}
