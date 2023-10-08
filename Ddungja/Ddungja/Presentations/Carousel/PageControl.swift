//
//  PageControl.swift
//  Ddungja
//
//  Created by 오승기 on 2023/10/06.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var totalPage: Int
    var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = totalPage
        control.currentPage = currentPage
        control.backgroundStyle = .automatic
        control.currentPageIndicatorTintColor = UIColor(Color.main)
        control.pageIndicatorTintColor = UIColor(Color.disabledText)
        control.allowsContinuousInteraction = false
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = totalPage
        uiView.currentPage = currentPage
    }
}
