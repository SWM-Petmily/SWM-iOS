//
//  HealthScreeningView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI

struct HealthScreeningView: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let postId: Int
    
    init(viewModel: PetCertificationViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        CertificationCommonView(viewModel: viewModel,
                                title: "건강검진 정보 인증 Tip!",
                                tip: "** 건강검진 결과를 사진으로 등록해주세요!",
                                postId: postId,
                                type: .healtInfo)
    }
}
