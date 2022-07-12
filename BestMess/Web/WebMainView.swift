//
//  WebMainView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import SwiftUI

struct WebMainView: View {
    @State private var showWebView = false
    
    var body: some View {
        VStack {
            Button {
                showWebView.toggle()
            } label: {
                Text("Hacking with swift")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

        }
        .sheet(isPresented: $showWebView) {
            WebUIView(urlString: "https://www.hackingwithswift.com/100/swiftui")
        }
    }
}

struct WebMainView_Previews: PreviewProvider {
    static var previews: some View {
        WebMainView()
    }
}
