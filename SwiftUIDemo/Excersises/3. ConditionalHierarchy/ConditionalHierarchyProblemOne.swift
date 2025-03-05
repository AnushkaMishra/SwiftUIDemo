//
//  ImplicitIdentity.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/10/24.
//

import SwiftUI

// MARK: EXAMPLE 1: impact on animation AND onAppear

struct ConditionalHierarchyProblemOne: View {
    
    struct Doggo {
        var isGood: Bool
    }
    @State var dog = Doggo(isGood: false)
    @State private var isPawFilled = false
    var body: some View {
        if dog.isGood {
            PawView(tint: .green)
                .frame(maxHeight: .infinity,
                       alignment: .top)
                .onTapGesture {
                    withAnimation {
                        dog.isGood.toggle()
                    }
            }
        } else {
            PawView(tint: .red)
                .frame(maxHeight: .infinity,
                       alignment: .bottom)
                .onTapGesture {
                    withAnimation {
                        dog.isGood.toggle()
                    }
                }
        }
    }
}

enum DoggoType {
    case good
    case bad
}

struct PawView: View {
    var tint: Color
    
    init(tint: Color) {
        self.tint = tint
    }
    
    var body: some View {
        Circle()
            .fill(tint)
            .overlay {
                Image(systemName: "pawprint")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .onAppear(perform: {
                print("PawView - onAppear called")
            })
    }
}

#Preview {
    ConditionalHierarchyProblemOne()
}
 
 

/*
 Prefer “breaking” a modifier over a condition to include it:
 
 // fine
 SomeView()
     .matchedGeometryEffect(id: "id", in: ns, properties: matchTop ? .top : []])
 
 // avoid
 if matchTop {
     SomeView()
         .matchedGeometryEffect(id: "id", in: ns, properties: .top)
 } else {
     SomeView()
 }
 
 Here is what Raj Ramamurthy said towards the end of Demystify SwiftUI WWDC talk:
 
 “Branches are great, and they exist in SwiftUI for a reason. But when used unnecessarily, they can cause poor performance, surprising animations, and […] even loss of state.

 When you introduce a branch, pause for a second and consider whether you're representing multiple views or two states of the same view.”

Inert modifiers:
 
SwiftUI framework is smart enough to understand and optimize your view hierarchy. It provides us with a set of inert view modifiers which doesn’t affect view tree, and you can use them for free. Let’s take a look at some of them in the example below.

struct AchievementView: View {
    let isEnabled: Bool

    var body: some View {
        ComplexView()
            .opacity(isEnabled ? 1 : 0)
            .padding(isEnabled ? 8 : 0)
    }
}
 
There is no changes in the view tree when you set the padding to 0 or opacity to 1. SwiftUI understands that and doesn’t apply these view modifiers. That’s why we call them inert view modifiers. Try to use them as much as possible to improve the performance of your view and remove unwanted transitions.
https://swiftwithmajid.com/2021/12/09/structural-identity-in-swiftui/
 https://developer.apple.com/videos/play/wwdc2021/10022/

*/
