//
//  HomeRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Combine

protocol HomeRepositoryInterface {
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, CustomErrorVO>
    func requestChangeDisLike(_ id: Int) -> AnyPublisher<Void, CustomErrorVO>
    func requestChangeLike(_ id: Int) -> AnyPublisher<Void, CustomErrorVO> 
    func getDetailPost(_ id: Int) -> AnyPublisher<DetailPostVO, CustomErrorVO>
}
