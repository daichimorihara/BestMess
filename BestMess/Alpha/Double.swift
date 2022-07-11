//
//  Double.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/10.
//

import Foundation

extension Double {
    
    private var formatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func stringWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return formatter2.string(from: number) ?? "0.00"
    }
}
