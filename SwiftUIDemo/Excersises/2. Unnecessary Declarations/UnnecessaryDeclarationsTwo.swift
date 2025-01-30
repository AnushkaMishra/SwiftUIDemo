//
//  UnnecessaryDeclarationsTwo.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 31/01/25.
//

import SwiftUI

class TestObservableObject: ObservableObject {
    @Published var value = 10
}

struct UnnecessaryDeclarationsTwo: View {
    @StateObject var obsObject: TestObservableObject = .init()
    var body: some View {
        VStack {
            VStack {
                TestObservableObjectView(obsObject: obsObject)
            }
            Button("change") {
                obsObject.value = Int.random(in: 0...100)
            }
        }
    }
}

struct TestObservableObjectView: View {
    @ObservedObject var obsObject: TestObservableObject
    var body: some View {
        let _ = Self._printChanges()
        Text("Sub View")
    }
}
