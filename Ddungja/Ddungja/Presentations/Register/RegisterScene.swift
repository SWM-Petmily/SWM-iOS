//
//  RegisterScene.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct RegisterScene: View {
    @ObservedObject private var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Color.blue
    }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScene()
    }
}
