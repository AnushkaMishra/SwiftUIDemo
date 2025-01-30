//
//  ConditionalModifierSolution.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

// MARK: EXAMPLE 1: impact on animation AND onAppear

struct ConditionalHierarchySolutionOne: View {
    
    struct Doggo {
        var isGood: Bool
    }
    @State var dog = Doggo(isGood: false)
    @State private var isPawFilled = false
    var body: some View {
        //By default, try to preserve identity and provide more fluid transitions.
        PawView(tint: dog.isGood ? .green : .red)
            .frame(maxHeight: .infinity, alignment: dog.isGood ? .top : .bottom)
            .onTapGesture {
                withAnimation {
                    dog.isGood.toggle()
                }
            }
        // Uncomment following line to trigger view updates
//            .id(UUID())
    }
}
