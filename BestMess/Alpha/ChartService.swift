//
//  ChartService.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/10.
//

import Foundation

class ChartService {
    
    func fetchChartData() async throws -> [Double] {
        let urlString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=demo"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decoded = try? JSONDecoder().decode(ChartModel.self, from: data) {
                let dic = decoded.timeSeriesDaily.sorted(by: { $0.key > $1.key }).prefix(30)
                var returnedData = [Double]()
                
                for (_, value) in dic {
                    returnedData.append(Double(value.close) ?? 0.0)
                }
                
                return returnedData
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
        
    }
        
}
