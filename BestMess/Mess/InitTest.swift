//
//  InitTest.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/23.
//

import SwiftUI

class InitTestViewModel: ObservableObject {
    @Published var isLoading = false
    init() {
        getImage()
        self.isLoading = true
    }
    
    func getImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isLoading = false
        }
    }
}

struct InitTest: View {
    @StateObject var vm = InitTestViewModel()
    
    var body: some View {
        ZStack {
                
            if vm.isLoading {
                ProgressView()
            } else {
                Text("Hi")
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

struct InitTest_Previews: PreviewProvider {
    static var previews: some View {
        InitTest()
    }
}
