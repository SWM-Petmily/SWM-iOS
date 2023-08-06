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
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.getRegisteredPet()
        }
    }
}
