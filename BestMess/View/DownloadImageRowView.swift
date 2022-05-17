//
//  DownloadImageRowView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/17.
//

import SwiftUI

struct DownloadImageRowView: View {
    let model: PhotoModel
    
    var body: some View {
        HStack {
            ProfilePictureView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(model.title)
                
                Text(model.url)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct DownloadImageRowView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageRowView(model: PhotoModel(albumId: 1,
                                               id: 1,
                                               title: "YED",
                                               url: "https://via.placeholder.com/600/92c952",
                                               thumbnailUrl:
                                                "GNEIOHNEIHNEG"))
    }
}
