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
            }
            .store(in: &cancellables)
    }
}
