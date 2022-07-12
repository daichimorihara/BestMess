//
//  PreviewProvider.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/10.
//

import Foundation
import SwiftUI


extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    
    let data: [Double] = [21, 22, 23, 25, 34, 31, 28, 26, 29, 30, 34, 35, 41, 38, 35, 30, 29, 27, 28, 29, 30, 29]
}
