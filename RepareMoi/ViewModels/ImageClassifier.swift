//
//  ImageClassifier.swift
//  RepareMoi
//
//  Created by Apprenant 39 on 14/12/2021.
//

import Foundation
import UIKit

class ImageClassifier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
    
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
