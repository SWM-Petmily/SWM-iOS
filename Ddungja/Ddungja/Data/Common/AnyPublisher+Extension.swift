//
//  AnyPublisher+Extension.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Combine
import Moya
import Foundation

extension AnyPublisher<Response, MoyaError> {
    func asResult<Value: Decodable>() -> AnyPublisher<Value, CustomErrorVO> {
        self
            .retry(3)
            .eraseToAnyPublisher()
            .filterSuccessfulStatusCodes()
            .tryMap { response in
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    throw MoyaError.statusCode(response)
                }
                do {
                    return try response.map(Value.self)
                } catch {
                    throw MoyaError.objectMapping(error, response)
                }
            }
            .catch { error -> AnyPublisher<Value, CustomErrorVO> in
                let cutom = CustomErrorVO(code: -1, status: "", message: "", title: "오류가 발생했습니다", detailMessage: "다시 접속해주세요", icon: "", iconColor: "")
                guard let moyaError = error as? MoyaError else {
                    return Fail(error: cutom).eraseToAnyPublisher()
                }
                
                switch moyaError {
                case .statusCode(let response):
                    if response.statusCode == 401 {
                        //토큰 만료인 경우로 재처리 로직 들어가야함
                    } else {
                        let decoder = JSONDecoder()
                        if let customError = try? decoder.decode(CustomErrorVO.self, from: response.data) {
                            return Fail(error: customError).eraseToAnyPublisher()
                        }
                    }
                default:
                    return Fail(error: cutom).eraseToAnyPublisher()
                }
                return Fail(error: cutom).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func asResult() -> AnyPublisher<Void, CustomErrorVO> {
        self
            .retry(3)
            .eraseToAnyPublisher()
            .filterSuccessfulStatusCodes()
            .tryMap { response in
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    throw MoyaError.statusCode(response)
                }
                do {
                    return 
                } catch {
                    throw MoyaError.objectMapping(error, response)
                }
            }
            .catch { error -> AnyPublisher<Void, CustomErrorVO> in
                let cutom = CustomErrorVO(code: -1, status: "", message: "", title: "오류가 발생했습니다", detailMessage: "다시 접속해주세요", icon: "", iconColor: "")
                guard let moyaError = error as? MoyaError else {
                    return Fail(error: cutom).eraseToAnyPublisher()
                }
                
                switch moyaError {
                case .statusCode(let response):
                    if response.statusCode == 401 {
                        //토큰 만료인 경우로 재처리 로직 들어가야함
                    } else {
                        let decoder = JSONDecoder()
                        if let customError = try? decoder.decode(CustomErrorVO.self, from: response.data) {
                            return Fail(error: customError).eraseToAnyPublisher()
                        }
                    }
                default:
                    return Fail(error: cutom).eraseToAnyPublisher()
                }
                return Fail(error: cutom).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
