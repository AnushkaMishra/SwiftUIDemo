//
//  Throttle.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 29/01/25.
//

import SwiftUI
import Combine

class ThrottleViewModel: ObservableObject {
    @Published var buttonTapCount: Int = 0
    @Published var executionTimes = 0
    
    func updateButtonTapCount() {
        buttonTapCount += 1
    }
    
    func resetCount() {
        executionTimes = 0
        buttonTapCount = 0
    }
}

struct ThrottleView: View {
    @ObservedObject var viewModel: ThrottleViewModel = .init()
    @State var disableButton: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Throttle")) {
                Button("Button tap") {
                    viewModel.updateButtonTapCount()
                }.disabled(disableButton)
                Text("Num of button taps: \(viewModel.buttonTapCount)")
                Text("Num code executions: \(viewModel.executionTimes)")
                
                Button(action: {
                    self.viewModel.resetCount()
                }) {
                    Text("Reset")
                }
            }
        }.onReceive(viewModel.$buttonTapCount.dropFirst().throttle(for: 5, scheduler: RunLoop.main, latest: false)) { searchTerm in
            viewModel.executionTimes += 1
        }
    }
}
