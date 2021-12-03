//
//  MapButton.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 03/12/2021.
//

import SwiftUI

struct MapButton: View {
    
    let image: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2
                        , x: 2, y: 2)
            Image(systemName: image)
                .font(.largeTitle)
        }
    }
}

struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton(image: "slider.horizontal.3")
    }
}
