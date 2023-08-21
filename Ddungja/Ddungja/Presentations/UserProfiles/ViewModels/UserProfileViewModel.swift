//
//  UserProfileViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Foundation
import Combine

enum ImageStatus: Int {
    case bulldog = 1
    case dog1
    case dog2
    case poodle
    
    var description: String {
        switch self {
        case .bulldog: return "bulldog"
        case .dog1: return "dog1"
        case .dog2: return "dog2"
        case .poodle: return "poodle"
        }
    }
}
enum EmploymentStatus: String {
    case employed = "직장인"
    case student = "학생"
    case unemployed = "무직"
    case unowned = "unowned"
}

enum ExperienceStatus: String {
    case yes = "있음"
    case no = "없음"
    case none = "unowned"
    
    var description: Bool {
        switch self {
        case .yes: return true
        case .no: return false
        case .none: return false
        }
    }
}

enum HouseStatus: String {
    case oneRoom = "원룸"
    case apart = "아파트"
    case op = "오피스텔"
    case house = "단독주택"
}

final class UserProfileViewModel: BaseViewModel {
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var nickname = ""
    @Published var image: ImageStatus = .bulldog
    @Published var job: EmploymentStatus = .unowned
    @Published var experience: ExperienceStatus = .none
    @Published var house: HouseStatus = .house
    @Published var person = 0
    @Published var comment = ""
    @Published var region = ""
    @Published var openTalk = ""
    @Published var experienceArray = [(id: String, species: String, period: Int)]()
    @Published var isShowModal = false
    
    init(coordinator: CoordinatorProtocol, profileUsecase: ProfileUsecaseInterface) {
        self.profileUsecase = profileUsecase
        
        super.init(coordinator: coordinator)
    }
    
    func getProfile() {
        profileUsecase.getUserProfile()
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                }
            } receiveValue: { [weak self] profileVo in
                print("profileVoprofileVo \(profileVo)")
                guard let self = self else { return }

                self.nickname = profileVo.nickname
                self.image = self.changeToImageStatus(profileVo.profileImageId)
                self.job = self.changeToJobStatus(profileVo.job)
                self.experience = self.changeToExperience(profileVo.isExperience)
                self.house = self.changeToHomeStatus(profileVo.environment)
                self.region = profileVo.region
                self.person = profileVo.people
                self.experienceArray = profileVo.experiences
                self.comment = profileVo.comment
                self.openTalk = profileVo.openTalk
            }
            .store(in: &cancellables)
    }
    
    func registerProfile(_ isRegistered: Bool) {
        let vo = ProfileEditVO(job: job.rawValue, environment: house.rawValue, people: person, comment: comment, openTalk: openTalk, region: region, isExperience: experience.description, profileImageId: image.rawValue, experiences: experienceArray)
        if isRegistered {
            putEditProfile(vo)
        } else  {
            postEditProfile(vo)
        }
    }
    
    private func postEditProfile(_ profile: ProfileEditVO) {
        profileUsecase.postEditProfile(profile: profile)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                    self.errorIcon = error.icon
                    self.errorIconColor = error.iconColor
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.isShowModal = true
            }
            .store(in: &cancellables)
    }
    
    private func putEditProfile(_ profile: ProfileEditVO) {
        
        profileUsecase.putEditUserProfile(profile: profile)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                    self.errorIcon = error.icon
                    self.errorIconColor = error.iconColor
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.isShowModal = true
            }
            .store(in: &cancellables)
    }
    
    private func makeExperienceArray() {
        for v in experienceArray {
            experienceArray.append((id: v.id,species: v.species, period: v.period))
        }
    }
    
    private func changeToImageStatus(_ image: Int) -> ImageStatus {
        if let status = ImageStatus(rawValue: image) {
            return status
        } else {
            return .bulldog
        }
    }
    
    private func changeToJobStatus(_ job: String) -> EmploymentStatus {
        if let status = EmploymentStatus(rawValue: job) {
            return status
        } else {
            return .student
        }
    }
    
    private func changeToExperience(_ experience: Bool) -> ExperienceStatus {
        if !experience {  return .no }
        else { return .yes }
    }
    
    private func changeToHomeStatus(_ home: String) -> HouseStatus {
        if let status = HouseStatus(rawValue: home) {
            return status
        } else {
            return .oneRoom
        }
    }
}
