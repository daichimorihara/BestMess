//
//  ProfilePictureView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/17.
//

import SwiftUI

struct ProfilePictureView: View {
    @ObservedObject var vm: ProfilePictureViewModel
    
    init(url: String, key: String) {
        vm = ProfilePictureViewModel(url: url, key: key)
    }
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView(url: "HIGE", key: "jf")
    }
}
