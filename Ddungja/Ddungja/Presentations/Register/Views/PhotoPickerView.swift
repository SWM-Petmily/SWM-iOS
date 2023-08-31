//
//  PhotoPickerView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/06.
//

import SwiftUI
import PhotosUI

protocol PhotoPickerInterface: ObservableObject {
    var selectedPhotoItem: [PhotosPickerItem] { get set }
    func updateImage(_ data: Data, index: Int)
}

struct PhotoPickerView<T: PhotoPickerInterface>: View {
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        PhotosPicker(selection: $viewModel.selectedPhotoItem, maxSelectionCount: 5, selectionBehavior: .ordered, matching: .images, photoLibrary: .shared()) {
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
        .onChange(of: viewModel.selectedPhotoItem) { selectedItems in
            for (idx, item) in selectedItems.enumerated() {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        viewModel.updateImage(data, index: idx)
                    }
                }
            }
        }
    }
}
