//
//  SignUpViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import Combine

final class SignUpViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private var signUpUsecase: SignUpUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    private(set) var id: Int = -1
    
    @Published var phoneNumber = ""
    
    init(coordinator: CoordinatorProtocol, signUpUsecase: SignUpUsecaseInterface) {
        self.coordinator = coordinator
        self.signUpUsecase = signUpUsecase
    }
    
    func requestPhoneNumberCertification(_ phoneNumber: String) {
        signUpUsecase.requestCertification(about: phoneNumber)
            .sink { error in
                print(error)
            } receiveValue: { vo in
                print("vo is \(vo)")
                self.id = vo.certificationId
            }
            .store(in: &cancellables)
    }
    
    func checkCertificationNumber(_ certification: String) {
        signUpUsecase.checkCertification(id, phoneNumber, certification)
            .sink { error in
                print("error \(error)")
            } receiveValue: { response in
                print("response \(response)")
            }
            .store(in: &cancellables)
    }
        
    func registerUserInfo(_ nickname: String) {
        signUpUsecase.registerUserInfo(id, nickname, phoneNumber)
            .sink { error in
                print("registere user Info \(error)")
            } receiveValue: { bool in
                print("registerUserInfo response\(bool)")
            }
            .store(in: &cancellables)
    }
}
