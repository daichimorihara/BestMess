//
//  SubscriberView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/14.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpTimer()
        addTextFieldSubsciber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let self = self else { return }
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
    func addTextFieldSubsciber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            .sink { [weak self] textIsValid in
                self?.textIsValid = textIsValid
            }
            .store(in: &cancellables)
    }
    
    
    func setUpTimer() {
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
            }
            .store(in: &cancellables)
    }
}

struct SubscriberView: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .frame(height: 50)
                .padding(.leading)
                .font(.headline)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0 :
                                vm.textIsValid ? 0 : 1)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1 : 0)
                    }
                    .font(.title)
                    .padding(.trailing)
                    
                    , alignment: .trailing
                )
            
            Button {
                
            } label: {
                Text("Submit")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(7)
                    .opacity(vm.showButton ? 1 : 0.5)
            }
            .disabled(!vm.showButton)

                
        }
        .padding()
    }
}

struct SubscriberView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberView()
    }
}
