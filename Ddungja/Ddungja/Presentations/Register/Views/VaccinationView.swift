//
//  VaccinationView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI

struct VaccinationView: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let postId: Int
    
    init(viewModel: PetCertificationViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        CertificationCommonView(viewModel: viewModel,
                                title: "예방접종 인증 Tip!",
                                tip: "** 병원에 직접 방문하거나, 인투펫 등의 동물병원 내역 조회 서비스를 통한 백신 내역을 올려주세요!",
                                postId: postId, type: .vaccineInfo)
    }
}
