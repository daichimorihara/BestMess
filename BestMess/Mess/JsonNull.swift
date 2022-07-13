//
//  JsonNull.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/13.
//

import Foundation
import SwiftUI

struct Name: Decodable {
    let name: String?
    let yes: String
}

class JsonNull: ObservableObject {

    @Published var name: Name?
    
    func fetch() {
        let jsonString = """
{"name": null,
"yes": "wow"
}
"""
        let jsonData = Data(jsonString.utf8)
        if let deco = try? JSONDecoder().decode(Name.self, from: jsonData) {
            print("Success")
            self.name = deco
        } else {
            print("NIB")
            self.name = Name(name: "Error", yes: "Error")
        }
    }
}

struct JsonNullView: View {
    @StateObject var vm = JsonNull()
    var body: some View {
        Text(vm.name?.yes ?? "Error")
            .onAppear {
                vm.fetch()
            }
    }
}
