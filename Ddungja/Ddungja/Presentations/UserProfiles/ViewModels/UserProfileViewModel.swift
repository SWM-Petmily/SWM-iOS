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
}

enum ExperienceStatus {
    case yes
    case no
    
    var description: Bool {
        switch self {
        case .yes: return true
        case .no: return false
        }
    }
}

enum HouseStatus: String {
    case oneRoom = "원룸"
    case apart = "아파트"
    case op = "오피스텔"
    case house = "단독주택"
}

final class UserProfileViewModel: ObservableObject {
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @Published var profile: ProfileVO
    @Published var experienceArray = [(id: UUID, species: String, period: Int)]()
    @Published var isShowModal = false
    
    init(profileUsecase: ProfileUsecaseInterface) {
        self.profileUsecase = profileUsecase
//        getProfile()
        profile = ProfileVO(job: "직장인", environment: "집", people: 55, comment: "", openTalk: "https://www.figma.com/file/muKSM51SkedsMlS0YR70ZK/펫밀리?type=design&node-id=552-4601&mode=design&t=leWB2I2Rz6BHFCRj-0", region: "광주", isExperience: false, nickname: "seunggi", profileImage: "bulldog", experiences: [(id: 1, species: "불독", period: 16), (id: 2, species: "푸들", period: 13), (id: 3, species: "기타", period: 11)])
    }
    
    private func getProfile() {
        profileUsecase.getUserProfile()
            .sink { errpr in
                print("Cheeck \(errpr)")
            } receiveValue: { profileVo in
                print(profileVo)
                self.profile = profileVo
            }
            .store(in: &cancellables)
    }
    
    private func makeExperienceArray() {
        for v in profile.experiences {
            experienceArray.append((id: UUID(),species: v.species, period: v.period))
        }
    }

    func putEditProfile(_ profile: ProfileEditVO) {
        
        profileUsecase.putEditUserProfile(profile: profile)
            .sink { error in
                print(error)
            } receiveValue: { value in
                if value != -1 {
                    self.isShowModal = true
                }
            }.store(in: &cancellables)
    }
    
    func changeToJobStatus(_ job: String) -> EmploymentStatus {
        if let status = EmploymentStatus(rawValue: job) {
            return status
        } else {
            return .student
        }
    }
    
    func changeToExperience(_ experience: Bool) -> ExperienceStatus {
        if !experience {  return .no }
        else { return .yes }
    }
    
    func changeToHomeStatus(_ home: String) -> HouseStatus {
        if let status = HouseStatus(rawValue: home) {
            return status
        } else {
            return .oneRoom
        }
    }
}
