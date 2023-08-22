//
//  HomeAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Moya
import CombineMoya
import Combine

protocol HomeDataSourceInterface {
    func getMainPost(_ page: Int) -> AnyPublisher<HomeDTO, CustomErrorVO>
    func requestChangeDislike(_ id: Int) -> AnyPublisher<Void, CustomErrorVO> 
    func requestChangeLike(_ id: Int) -> AnyPublisher<Void, CustomErrorVO>
    func getDetailPost(_ id: Int) -> AnyPublisher<DetailPostDTO, CustomErrorVO>
}

final class HomeAPIProvider: HomeDataSourceInterface {
    private let moyaProvider: MoyaProvider<HomeAPI>
    
    init(moyaProvider: MoyaProvider<HomeAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getMainPost(_ page: Int) -> AnyPublisher<HomeDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.mainPost(page: page))
            .asResult()
    }
    
    func requestChangeDislike(_ id: Int) -> AnyPublisher<Void, CustomErrorVO> {
        moyaProvider.requestPublisher(.disLike(id: id))
            .asResult()
    }
    
    func requestChangeLike(_ id: Int) -> AnyPublisher<Void, CustomErrorVO> {
        return moyaProvider.requestPublisher(.like(id: id))
            .asResult()
    }
    
    func getDetailPost(_ id: Int) -> AnyPublisher<DetailPostDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.detailPost(id: id))
            .asResult()
    }
}
