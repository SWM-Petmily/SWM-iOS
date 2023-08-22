//
//  SignUpViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import Combine
import SwiftUI

final class SignUpViewModel: BaseViewModel {
    private var signUpUsecase: SignUpUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var showCertificationNumber = false
    @Published var phoneNumber = ""
    @Published var nickName = ""
    @Published var isActiveRequestButton = false
    @Published var isActiveRegisterButton = false
    @Published var isSuccessVerify = false
    
    var requestTextColor: CustomColor = .disabledTextColor
    var requestBackgroundColor = Color.buttonBackground
    
    var registerTextColor: CustomColor = .disabledTextColor
    var registerBackgroundColor = Color.buttonBackground
    
    init(coordinator: CoordinatorProtocol, signUpUsecase: SignUpUsecaseInterface) {
        self.signUpUsecase = signUpUsecase
        
        super.init(coordinator: coordinator)
    }
    
    func requestPhoneNumberCertification(_ phoneNumber: String) {
        signUpUsecase.requestCertification(about: phoneNumber)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] vo in
                print("vo is \(vo)")
                self?.showCertificationNumber = true
            }
            .store(in: &cancellables)
    }
    
    func checkCertificationNumber(_ certification: String) {
        signUpUsecase.checkCertification(certification)
            .sink { error in
                print("error \(error)")
            } receiveValue: { [weak self] response in
                print("response \(response)")
                self?.isSuccessVerify = true
            }
            .store(in: &cancellables)
    }
        
    func registerUserInfo(_ nickname: String) {
        signUpUsecase.registerUserInfo(nickname)
            .sink { error in
                print("registere user Info \(error)")
            } receiveValue: { [weak self] bool in
                print("registerUserInfo response\(bool)")
                self?.pop()
                self?.push(.tapBar)
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
    
    func register() {
        if isSuccessVerify && !nickName.isEmpty {
            registerTextColor = .white
            registerBackgroundColor = .main
            isActiveRegisterButton = false
        } else {
            registerTextColor = .disabledTextColor
            registerBackgroundColor = .buttonBackground
            isActiveRegisterButton = true
        }
    }
}
