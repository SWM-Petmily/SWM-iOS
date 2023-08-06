//
//  PhotoPickerView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/06.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @ObservedObject private var viewModel: RegisterViewModel
    @State private var selectedItem: [PhotosPickerItem] = []
    
    init(viewModel: RegisterViewModel) {
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
                        viewModel.images.insert(data, at: idx)
                    }
                }
            }
        }
    }
}
