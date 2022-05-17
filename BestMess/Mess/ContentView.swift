//
//  ContentView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/13.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Current Time
    /*
    @State private var currentDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        return formatter
    }
     */
    
    // CountDown
    /*
    @State private var count: Int = 10
    @State private var finishedText: String?
    */
    
    // Countdown to Date
    /*
    @State private var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour): \(minute): \(second)"
    }
    */
    
    @State private var count: Int = 1
    
     
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.gray, .black]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? 30 : 0)
                Circle()
                    .offset(y: count == 2 ? 30 : 0)
                Circle()
                    .offset(y: count == 3 ? 30 : 0)
            }
            .frame(width: 200)
            .foregroundColor(.white)
            
            
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 3 ? 1 : count + 1
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
