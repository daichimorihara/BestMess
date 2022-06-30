//
//  AsyncCall.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/06/30.
//

import SwiftUI

class AsyncCallViewModel: ObservableObject {
    
}

struct AsyncCall: View {
    @State private var yes :Int = 0
    var body: some View {
        VStack {
            Text("\(yes)")

        }
//        .task {
//            await process()
//            await process()
//        }
        .onAppear {
            Task {
                await process()
                await process()
            }
        }
    }
    
        
    
    func process() async {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            yes += 1
        }
    }
}

struct AsyncCall_Previews: PreviewProvider {
    static var previews: some View {
        AsyncCall()
    }
}
