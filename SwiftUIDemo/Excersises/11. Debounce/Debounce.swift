//
//  ThrottleVsDebounce.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 29/01/25.
//

import SwiftUI
import Combine

class DebounceViewModel: ObservableObject {
    @Published var userInput: String = ""
    @Published var executionTimes = 0
}
struct DebounceButtonView: View {
    @ObservedObject private var viewModel = DebounceViewModel()

    var body: some View {
        Form {
            Section(header: Text("Throttle")) {
                TextField("User Input", text: $viewModel.userInput)
                    .padding()
                Text("Num code executions: \(viewModel.executionTimes)")
                
                Button(action: {
                    self.viewModel.executionTimes = 0
                }) {
                    Text("Reset Count")
                }
            }
        }.onReceive(viewModel.$userInput.dropFirst().debounce(for: 1, scheduler: RunLoop.main)) { searchTerm in
            viewModel.executionTimes += 1
        }
    }

}
