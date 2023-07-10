//
//  ModalView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/09.
//

import SwiftUI

struct ModalView: View {
    let isSuccess: Bool
    
    var body: some View {
        
        if isSuccess {
            VStack(spacing: 10) {
            
                Text("프로필 작성완료")
                    .font(.title)
                Text("프로필 작성이 완료되었습니다!")
                Spacer()
            }
            .padding()
        } else {
            Text("네트워크 통신 에러")
            Text("네트워크 환경을 점검해주세요")
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(isSuccess: true)
    }
}
