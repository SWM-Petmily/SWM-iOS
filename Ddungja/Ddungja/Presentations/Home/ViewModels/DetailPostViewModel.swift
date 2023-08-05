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
    private(set) var applyCommon: ApplyCommonViewModel
    private var cancellables = Set<AnyCancellable>()
    
    @Published var detail: DetailPostVO?
    @Published var imagesURLString = [(id: String, url: String)]()
    @Published var diseaseInfo = [String]()
    @Published var buttonText = ""
    @Published var buttonDisabled = false
    @Published var buttonBackground = Color.buttonBackground
    @Published var textColor = CustomColor.disabledTextColor
    @Published var like = false
    @Published var likeCount = -1
    
    private var buttonActionSubject = PassthroughSubject<(isWriter: Bool, isApply: Bool, state: String), Never>()
    var likeActionSubject = PassthroughSubject<(), Never>()
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface, applyCommon: ApplyCommonViewModel) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
        self.applyCommon = applyCommon
        
        buttonActionSubject.sink { [weak self] (isWriter, isApply, state) in
            guard let self = self else { return }
            self.buttonText = changeButtonText(isWriter, isApply, state)
            self.buttonDisabled = changeButtonAbled(isWriter, isApply, state)
        }
        .store(in: &cancellables)
        
        likeActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            likeCount = like ? likeCount - 1 : likeCount + 1
        }
        .store(in: &cancellables)
    }
    struct LikeButton {
        let imageName: String
        let color: Color
    }
    
    private func changeButtonAbled(_ isWriter: Bool, _ isApply: Bool, _ state: String) -> Bool {
        if state == "SAVE" {
            if isWriter {
                buttonBackground = Color.main
                textColor = .white
                return false
            } else {
                if isApply {
                    buttonBackground = Color.buttonBackground
                    textColor = CustomColor.disabledTextColor
                    return true
                } else {
                    buttonBackground = Color.main
                    textColor = .white
                    return false
                }
            }
        }
        return false
    }
    
    private func changeButtonText(_ isWriter: Bool, _ isApply: Bool, _ state: String) -> String {
        if state == "COMPLETE" {
            return "입양 완료된 게시물"
        } else if state == "DELETE" {
            return "삭제된 게시물"
        } else {
            if isWriter {
                return "입양 완료"
            } else {
                if isApply {
                    return "입양 신청 완료"
                } else {
                    return "입양 신청하기"
                }
            }
        }
    }
    
    func tappedLike(_ postId: Int) {
        homeUsecase.tappedLike(postId, like)
            .sink { error in
                
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.like = !like
            }
            .store(in: &cancellables)
    }
    
    func likeButton(_ state: Bool) -> LikeButton {
        let imageName = state ? "heart.fill" : "heart"
        let color = state ? Color.main : Color.disabledText
        return LikeButton(imageName: imageName, color: color)
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
                self?.buttonActionSubject.send((vo.isWriter, vo.isApply, vo.status))
                self?.like = vo.isLike
                self?.likeCount = vo.likeCount
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

    func push(_ id: Int) {
        if buttonText == "입양 신청하기" {
            coordinator.push(.applyAdaption(postId: id))
        }
    }
    
    func moveToEditProfile() {
        coordinator.push(.editProfile)
    }
    
    func pop() {
        coordinator.pop()
    }
}
