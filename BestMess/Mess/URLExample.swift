//
//  URLExample.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import SwiftUI

struct URLExample: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "https://www.example.com") {
                openURL(url)
            }
        } label: {
            Label("Get Help", systemImage: "person.fill.questionmark")
        }
    }
}

struct URLExample_Previews: PreviewProvider {
    static var previews: some View {
        URLExample()
    }
}
