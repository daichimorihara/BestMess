//
//  WeakView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/15.
//

import SwiftUI

struct WeakView: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink {
                SecondWeakView()
            } label: {
                Text("Navigate")
            }
            .navigationTitle("Screen1")
            .navigationBarTitleDisplayMode(.inline)
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                
            ,alignment: .topTrailing
        )
    }
}

struct SecondWeakView: View {
    @StateObject var vm = WeakViewModel()
    var body: some View {
        VStack {
            Text("Second View")
            
            Text(vm.data ?? "")
        }
    }
}

class WeakViewModel: ObservableObject {
    @Published var data: String?
    
    init() {
        print("Initialize")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("Deinitialize")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data"
        }
    }
}

struct WeakView_Previews: PreviewProvider {
    static var previews: some View {
        WeakView()
    }
}
