//
//  MyPostsRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation


protocol MyPostsRepositoryInterface {
    func getMyEditPosts(_ status: String, _ page: Int)
}
