//
//  ClosureProblemOne.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

struct ClosureProblemOne: View {
    @State var value: Int = 0
    
    var body: some View {
        VStack {
            CollapsableProblemOne {
                Text("Value: \(value)")
            }
            Button("Increase") { value += 1 }
        }
    }
}

struct CollapsableProblemOne<Content: View>: View {
    @State var collapsed: Bool = true
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            if !collapsed {
                content
            }
            Button(collapsed ? "↓ open" : "↑ close") {
                collapsed.toggle()
            }
        }
    }
}
