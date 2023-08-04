//
//  ApplyCommonViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import Combine

final class ApplyCommonViewModel: ObservableObject {
    private let myPostsUsecase: MyApplyPostsUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @Published var detailApply: DetailApplyVO
    
    init(myPostsUsecase: MyApplyPostsUsecaseInterface) {
        self.myPostsUsecase = myPostsUsecase
        self.detailApply = DetailApplyVO(applyId: -1, nickname: "뚱자쓰", job: "-",environment: "-",people: 0,comment: "",region: "",isExperience: false,url: "", openTalk: "",approval: "",applyExperiences: [],isMyApply: false)
    }
    
    func getApplyInfo(id: Int) {
        myPostsUsecase.getApplyInfo(id: id)
            .sink { completion in
                print("getApplyInfo \(completion)")
            } receiveValue: { [weak self] vo in
                print("apply Common \(vo)")
                self?.detailApply = vo
            }
            .store(in: &cancellables)
    }
}
