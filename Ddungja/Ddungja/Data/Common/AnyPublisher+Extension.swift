//
//  AnyPublisher+Extension.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Combine
import Moya

extension AnyPublisher<Response, MoyaError> {
    func asResult<Value: Decodable>() -> AnyPublisher<Value, Error> {
        self
            .retry(3)
            .eraseToAnyPublisher()
            .map(Value.self)
            .catch { moyaError -> Fail in
                let networkErrorDTO = moyaError.toNetworkError()

                return Fail(error: networkErrorDTO.toVO())
            }
            .eraseToAnyPublisher()
    }
}
