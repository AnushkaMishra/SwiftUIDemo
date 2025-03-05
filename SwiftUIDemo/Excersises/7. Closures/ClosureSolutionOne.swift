import SwiftUI

struct ClosureSolutionOne: View {
    @State var value: Int = 0
    
    var body: some View {
        VStack {
            CollapsableSolutionOne {
                Text("Value: \(value)")
            }
            Button("Increase") { value += 1 }
        }
    }
}

struct CollapsableSolutionOne<Content: View>: View {
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
