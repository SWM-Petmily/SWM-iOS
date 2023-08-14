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

final class UserProfileViewModel: BaseViewModel {
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @Published var profile: ProfileVO
    
    @Published var image: ImageStatus = .bulldog
    @Published var job: EmploymentStatus = .student
    @Published var experience: ExperienceStatus = .no
    @Published var house: HouseStatus = .house
    @Published var person = 0
    @Published var comment = ""
    @Published var openTalk = ""
    @Published var experienceArray = [(id: String, species: String, period: Int)]()
    @Published var isShowModal = false
    
    init(coordinator: CoordinatorProtocol, profileUsecase: ProfileUsecaseInterface) {
        self.profileUsecase = profileUsecase
        
        profile = ProfileVO(job: "직장인", environment: "집", people: 55, comment: "", openTalk: "https://www.figma.com/file/muKSM51SkedsMlS0YR70ZK/펫밀리?type=design&node-id=552-4601&mode=design&t=leWB2I2Rz6BHFCRj-0", region: "광주", isExperience: false, nickname: "seunggi", profileImageId: 1, profileImage: "dog1", experiences: [(id: "1", species: "불독", period: 16), (id: "2", species: "푸들", period: 13), (id: "3", species: "기타", period: 11)])

        super.init(coordinator: coordinator)
    }
    
    func getProfile() {
        profileUsecase.getUserProfile()
            .sink { errpr in
                print("Cheeck \(errpr)")
            } receiveValue: { [weak self] profileVo in
                print("profileVoprofileVo \(profileVo)")
                guard let self = self else { return }
                self.profile = profileVo
                
                self.image = self.changeToImageStatus(profileVo.profileImageId)
                self.job = self.changeToJobStatus(profileVo.job)
                self.experience = self.changeToExperience(profileVo.isExperience)
                self.house = self.changeToHomeStatus(profileVo.environment)
                self.person = profileVo.people
                self.experienceArray = profileVo.experiences
                self.comment = profileVo.comment
                self.openTalk = profileVo.openTalk
            }
            .store(in: &cancellables)
    }
    
    private func makeExperienceArray() {
        for v in experienceArray {
            experienceArray.append((id: v.id,species: v.species, period: v.period))
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
