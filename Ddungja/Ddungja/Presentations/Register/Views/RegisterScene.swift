//
//  RegisterScene.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct RegisterScene: View {
    @StateObject private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            ForEach(viewModel.registeredPetInfo, id: \.id) { info in
                PetInfoRowView(info: info)
                    .onTapGesture {
                        viewModel.push(.petInfo(info: info))
                    }
            }
            .onDelete(perform: { indexSet in
                let index = indexSet[indexSet.startIndex]
                viewModel.deleteRegisteredInfo(index)
            })
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.userExitPost()
            viewModel.getRegisteredPet()
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("등록한 반려동물")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
        }
        .alert(viewModel.errorTitle, isPresented: $viewModel.showAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorDetailMessage)
        }
    }
}
