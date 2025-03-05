//
//  UnnecessaryDeclarationsThree.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 31/01/25.
//

import SwiftUI

struct UnnecessaryDeclarationsThree: View {
    @State var number: Int = 0
    var body: some View {
        VStack {
            VStack {
                TestPassedDependencyView(number: number)
            }
            Button("change") {
                number = Int.random(in: 0...100)
            }
        }
    }
}

struct TestPassedDependencyView: View {
    let number: Int
    var body: some View {
        let _ = Self._printChanges()
        Text("Sub View")
    }
}
