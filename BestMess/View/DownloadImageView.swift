//
//  DownloadImageView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/17.
//

import SwiftUI

struct DownloadImageView: View {
    @StateObject var vm = DownloadImageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(vm.dataArray) { model in
                        VStack {
                            DownloadImageRowView(model: model)
                                .padding(.horizontal)
                            
                            Divider()
                        }
                    }
                }
            }
            .navigationTitle("Downloading Images")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DownloadImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageView()
    }
}
