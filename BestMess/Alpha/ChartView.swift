//
//  ChartView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/10.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm = ChartViewModel()
    
    var body: some View {
        ScrollView {
            ChartView(data: vm.chartData)
            
            ForEach(vm.chartData, id: \.self) {
                Text(String($0))
            }
        }
        .task {
            await vm.fetchChartData()
        }
    }
}

struct ChartView: View {
    

    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let priceChange: Double
    
    
    var yAxis: Double {
        maxY - minY
    }
    
    init(data: [Double]) {
        self.data = data
        self.maxY = data.max() ?? 0
        self.minY = data.min() ?? 0
        self.priceChange = (data.last ?? 0) - (data.first ?? 0)
    }
        
    var body: some View {
        ScrollView {
            VStack {
                chartView
                    .frame(height: 200)
                    .background(chartBackground)
                    .overlay(chartYAxis, alignment: .leading)
            }
        }
        .font(.caption)

        
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data: dev.data)
    }
}

extension ChartView {
    private var chartView: some View {
        GeometryReader { geo in
            Path { path in
                for idx in data.indices {
                    let x = geo.size.width * CGFloat(data.count - 1 - idx) / CGFloat(data.count - 1)
                    let y = geo.size.height * CGFloat(1 - (data[idx] - minY) / yAxis)
                    if idx == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    }
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            .stroke(.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis: some View {
        VStack {
            Text(maxY.stringWith2Decimals())
            Spacer()
            let price = (maxY + minY) / 2
            Text(price.stringWith2Decimals())
            Spacer()
            Text(minY.stringWith2Decimals())
        }
    }
}
