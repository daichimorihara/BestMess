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
        ScrollView {
            Text("NEGOI")
            ForEach(vm.articles) { news in
                Text(news.title ?? "e")
            }
        }
        .task {
            await vm.downloadNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
