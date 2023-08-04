//
//  DetailPostViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import Foundation
import Combine
import SwiftUI

final class DetailPostViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol
    private let homeUsecase: HomeUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var detail: DetailPostVO?
    @Published var imagesURLString = [(id: String, url: String)]()
    @Published var diseaseInfo = [String]()
    @Published var buttonText = ""
    @Published var buttonDisabled = false
    
    private var fetchMoreActionSubject = PassthroughSubject<(isWriter: Bool, isApply: Bool, state: String), Never>()
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
        
        fetchMoreActionSubject.sink { [weak self] (isWriter, isApply, state) in
            guard let self = self else { return }
            self.buttonText = changeButtonText(isWriter, isApply, state)
            self.buttonDisabled = changeButtonAbled(isWriter, isApply, state)
        }
        .store(in: &cancellables)
    }
    
    func getDetailPost(_ id: Int) {
        homeUsecase.getDetailPost(id)
            .sink { error in
                print("getDetailPost error \(error)")
            } receiveValue: { [weak self] vo in
                print(vo)
                self?.detail = vo
                self?.imagesURLString = vo.images.map { (id: UUID().uuidString, url: $0.url) }
                self?.diseaseInfo = vo.diseases.map { $0 }
                self?.fetchMoreActionSubject.send((vo.isWriter, vo.isApply, vo.status))
            }
            .store(in: &cancellables)
    }
    
    func changIdToProfile(_ id: Int) -> String {
        switch id {
        case 1: return "bulldog"
        case 2: return "dog1"
        case 3: return "dog2"
        case 4: return "poodle"
        default: return "bulldog"
        }
    }
    
    func changeMonthToAge(_ month: Int) -> String {
        return month <= 12 ? "\(month)개월" : "\(month/12)년\(month%12)개월"
    }
    
    func changeGenderToImage(_ type: String) -> Image {
        return type == "MALE" ? Image("Male") : Image("Female")
    }
    
    private func changeButtonAbled(_ isWriter: Bool, _ isApply: Bool, _ state: String) -> Bool {
        if state == "SAVE" {
            if isWriter {
                return false
            } else {
                return isApply ? true : false
            }
        }
        return false
    }
    
    private func changeButtonText(_ isWriter: Bool, _ isApply: Bool, _ state: String) -> String {
        if state == "COMPLETE" {
            return "입양 완료된 게시물" //disabled
        } else if state == "DELETE" {
            return "삭제된 게시물" //disabled
        } else {
            if isWriter {
                return "입양 완료"
            } else {
                if isApply {
                    return "입양 신청 완료" //disabled
                } else {
                    return "입양 신청하기"
                }
            }
        }
    }

    func push(_ id: Int) {
        coordinator.push(.applyModify(id: id))
    }
    
    func pop() {
        coordinator.pop()
    }
}
