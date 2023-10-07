//
//  CarouselViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/10/06.
//

import SwiftUI

final class CarouselViewModel: ObservableObject {
    private(set) var listOfPages = [CarouselPage]()
    private(set) var fakedPages = [CarouselPage]()
    
    @Published var currentPage = ""
    
    init() {
        setupPages()
    }
    
    func calculate(rect: CGRect, size: CGSize, page: CarouselPage) {
        let minX = rect.minX
        let size = size
        let pageOffset = minX - (size.width * CGFloat(fakeIndex(page)))
        let pageProgress = pageOffset / size.width
        if -pageProgress < 1.0 {
            if fakedPages.indices.contains(fakedPages.count - 1) {
                currentPage = fakedPages[fakedPages.count - 1].id.uuidString
            }
        }
        if -pageProgress > CGFloat(fakedPages.count - 1) {
            if fakedPages.indices.contains(1) {
                currentPage = fakedPages[1].id.uuidString
            }
        }
    }
    
    func originalIndex() -> Int {
        return listOfPages.firstIndex { page in
            page.id.uuidString == currentPage
        } ?? 0
    }
    
    private func setupPages() {
        let pageNames = ["Info", "Negative", "Privacy", "Think"]
//        let pageTitle = ["어떤 사람에게나의반려동물을맡겨야할지 고민 중이에요.", "반려동물 파양에 대해 부정적으로 생각하시나요?", "반려동물에 대한 정보를 충분히 제공합니다.", "개인정보 노출 우려가 있으신가요?"]
        let sub = "반려동물의 파양은 종종 주인의 개인적인 이유나 환경 변화로 인해 발생합니다. 이는 반려동물의 문제가 아닌 주인의 상황과 이해 부족에서 비롯된 경우가 많습니다.\n 반려동물을 새로운 가정으로 보내는 것은 그들에게 새로운 기회와 따뜻한 사랑을 줄 수 있는 의미 있는 경험이 될 수 있습니다."
        listOfPages = pageNames.map { CarouselPage(id: UUID(), name: $0, title: "어떤 사람에게 나의 반려동물을 맡겨야 할지 고민 중이에요.", subTitle: sub) }
        
        fakedPages.append(contentsOf: listOfPages)
        
        if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
            currentPage = firstPage.id.uuidString
            
            firstPage.id = .init()
            lastPage.id = .init()
            
            fakedPages.append(firstPage)
            fakedPages.insert(lastPage, at: 0)
        }
    }
    
    private func fakeIndex(_ of: CarouselPage) -> Int {
        return fakedPages.firstIndex(of: of) ?? 0
    }
}
