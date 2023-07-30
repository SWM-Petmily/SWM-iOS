//
//  SignUpViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import Combine
import SwiftUI

final class SignUpViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private var signUpUsecase: SignUpUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    private(set) var id: Int = -1
    
    @Published var showCertificationNumber = false
    @Published var phoneNumber = ""
    @Published var nickName = ""
    @Published var isActiveRequestButton = false
    
    var requestTextColor: CustomColor = .disabledTextColor
    var requestBackgroundColor = Color.buttonBackground
    
    init(coordinator: CoordinatorProtocol, signUpUsecase: SignUpUsecaseInterface) {
        self.coordinator = coordinator
        self.signUpUsecase = signUpUsecase
    }
    
    func requestPhoneNumberCertification(_ phoneNumber: String) {
        signUpUsecase.requestCertification(about: phoneNumber)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] vo in
                print("vo is \(vo)")
                self?.id = vo.certificationId
                self?.showCertificationNumber = true
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
    
    func checkPhoneNumber() {
        let pattern = "^01[0-1, 7][0-9]{7,8}$"
        if let _ = phoneNumber.range(of: pattern, options: .regularExpression) {
            isActiveRequestButton = false
            requestTextColor = .mainColor
            requestBackgroundColor = .sub
        } else {
            isActiveRequestButton = true
            requestTextColor = .disabledTextColor
            requestBackgroundColor = .buttonBackground
        }
    }
}
