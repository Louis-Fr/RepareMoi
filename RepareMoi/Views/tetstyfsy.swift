//
//  tetstyfsy.swift
//  RepareMoi
//
//  Created by Odriste on 05/12/2021.
//

import SwiftUI

struct tetstyfsy: View {
    var body: some View {
        
        
        Image("GraphicComponentLarge")
            .resizable()
            .rotationEffect(.degrees(-7))
            .frame(width: 200, height: 200)
            .offset(x: -120, y: -300)
            .opacity(0.4)
    }
}

struct tetstyfsy_Previews: PreviewProvider {
    static var previews: some View {
        tetstyfsy()
    }
}
