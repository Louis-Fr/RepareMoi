//
//  CircleButtonChatView.swift
//  RepareMoi
//
//  Created by Apprenant 78 on 14/12/2021.
//

import SwiftUI

struct CircleButtonChatView: View {
    let iconName: String
    var body: some View {
        
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: 40, height: 40)
            .background(
            Circle()
                .foregroundColor(.white)
            )
            .shadow(color: .black.opacity(0.25),
                    radius: 8, x: 0, y: 0)
            .padding()
    }
}


struct CircleButtonChatView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonChatView(iconName: "info")
            .previewLayout(.sizeThatFits)
    }
}
