//
//  ChartViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/10.
//

import Foundation

@MainActor
class ChartViewModel: ObservableObject {
    
    
    @Published var chartData = [Double]()
    
    let chartService = ChartService()
    
    func fetchChartData() async {
        if let returnedChartData = try? await chartService.fetchChartData() {
            chartData = returnedChartData
        }
    }
}
