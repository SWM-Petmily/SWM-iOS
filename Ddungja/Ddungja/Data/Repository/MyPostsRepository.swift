//
//  MyPostsRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation


final class MyPostsRepository: MyPostsRepositoryInterface {
    let dataSource: MyPostsDataSourceInterface
    
    init(dataSource: MyPostsDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) {
        return dataSource.getMyEditPosts(status, page)
    }
}
