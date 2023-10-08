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
        let pageTitle = ["어떤 사람에게 나의 반려동물을 맡겨야할지 고민 중이에요.", "반려동물 파양에 대해 부정적으로 생각하시나요?", "반려동물에 대한 정보를 충분히 제공합니다.", "개인정보 노출 우려가 있으신가요?"]
        let sub = ["펫밀리를 통해서 상대방의 배경, 거주 환경, 반려동물 관련 경험 등을 파악하고, 상대방에 대한 이해를 도울 수 있는 정보를 얻을 수 있습니다. 이를 통해 사랑하는 나의 반려동물을 안심하고 맡길 수 있어요!",
                   "반려동물의 파양은 종종 주인의 개인적인 이유나 환경 변화로 인해 발생합니다. 이는 반려동물의 문제가 아닌 주인의 상황과 이해 부족에서 비롯된 경우가 많습니다. 반려동물을 새로운 가정으로 보내는 것은 그들에게 새로운 기회와 따뜻한 사랑을 줄 수 있는 의미 있는 경험이 될 수 있습니다.", "반려동물의 성격, 사진, 습관, 사육 방법 등을 통해 자신과 잘 맞는 반려동물을 찾을 수 있습니다. 뿐만 아니라 동물 등록 번호, 건강 검진 및 예방 접종 정보를 제공받아, 반려동물의 상태를 사전에 파악할 수도 있습니다.", "반려동물 파양을 위해 전화번호를 노출하는 것이 불안하다면, 입양을 희망하는 상대방과의 소통을 지원하기 위한 지원서 기능을 제공함으로써 전화번호를 노출 시키지 않고도 안전하게 정보를 공유할 수 있습니다. 이를 통해 원하는 상대와의 대화를 쉽게 이어나갈 수 있습니다."
        ]

        for i in 0..<pageNames.count {
            let carouselPage = CarouselPage(id: UUID(), name: pageNames[i], title: pageTitle[i], subTitle: sub[i])
            listOfPages.append(carouselPage)
        }
        
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
