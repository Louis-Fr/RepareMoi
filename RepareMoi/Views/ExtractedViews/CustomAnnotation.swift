//
//  CustomAnnotation.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 03/12/2021.
//

import SwiftUI

struct CustomAnnotation: View {
    
    let color: Color
    
    static let size: Double = 48.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: CGFloat(CustomAnnotation.size/2), height: CGFloat(CustomAnnotation.size/2))
                .rotationEffect(.degrees(45))
                .foregroundColor(color)
                .padding(.top, CGFloat((CustomAnnotation.size/2)+(CustomAnnotation.size/4.5)))
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: CGFloat(CustomAnnotation.size), height: CGFloat(CustomAnnotation.size))
                Image(systemName: "applewatch")
                    .foregroundColor(.white)
                    .font(.system(size: CustomAnnotation.size/2))
            }
        }
    }
}

struct CustomAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnnotation(color: .red)
    }
}
