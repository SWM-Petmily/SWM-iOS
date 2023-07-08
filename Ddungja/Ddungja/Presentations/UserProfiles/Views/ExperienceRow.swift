//
//  ExperienceRow.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/08.
//

import SwiftUI

struct ExperienceRow: View {
    
    @State var dog = ""
    @State var year = ""
    @State var month = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("반려동물 종")
                .applySubtitle(color: .mainTextColor)
            
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $dog)
                            
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                    }
                    .padding()
                }
            }
            
            Text("양육기간")
                .applySubtitle(color: .mainTextColor)
            
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $year)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            
                        Spacer()
                        
                        Text("년")
                    }
                    .padding()
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $month)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            
                        Spacer()
                        
                        Text("개월")
                    }
                    .padding()
                }
            }
        }
    }
}

struct ExperienceRow_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceRow()
    }
}
