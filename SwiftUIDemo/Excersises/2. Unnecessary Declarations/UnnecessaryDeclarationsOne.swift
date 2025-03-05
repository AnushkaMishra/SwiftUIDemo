//
//  UnnecessaryDeclarations.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 23/01/25.
//

import SwiftUI

struct MyEnvKey: EnvironmentKey {
    static var defaultValue = 10
}
extension EnvironmentValues {
    var myValue: Int {
        get { self[MyEnvKey.self] }
        set { self[MyEnvKey.self] = newValue }
    }
}

struct UnnecessaryDeclarationsOne: View {
    @State var i = 100
    var body: some View {
        VStack {
            VStack {
                TestEnvView()
            }
            .environment(\.myValue, i)
            Button("change") {
                i = Int.random(in: 0...100)
            }
        }
    }
}

struct TestEnvView: View {
    @Environment(\.myValue) private var myValue
    var body: some View {
        let _ = Self._printChanges()
        Text("Sub View")
    }
}
