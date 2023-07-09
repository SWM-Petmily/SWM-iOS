//
//  ExperienceRow.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/08.
//

import SwiftUI

struct ExperienceRow: View {
    
    let id: Int
    @State var species: String
    @State var year: String
    @State var month: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("반려동물 종")
                    .applySubtitle(color: .mainTextColor)
                
                Spacer()
                    
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                }
                .padding()
            }
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color.mainBackground)
                        .cornerRadius(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        TextField("", text: $species)
                            
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

//struct ExperienceRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ExperienceRow()
//    }
//}
