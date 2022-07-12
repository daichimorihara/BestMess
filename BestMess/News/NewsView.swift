//
//  NewsView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var vm = NewsViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
