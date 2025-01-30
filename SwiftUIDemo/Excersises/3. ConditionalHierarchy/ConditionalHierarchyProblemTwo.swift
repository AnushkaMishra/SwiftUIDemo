//
//  ImplicitIdentityProblemTwo.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

// MARK: EXAMPLE 2 - Loosing state

struct ConditionalHierarchyProblemTwo: View {
   @State var flag: Bool = false
   var body: some View {
       SampleOne(flag: flag)
       Button("Switch") {
           flag.toggle()
       }
   }
}

struct SampleOne: View {
   var flag: Bool
   var body: some View {
       Stateful()
//            .background(flag ? .red : .clear)
           .applyIf(condition: flag) {
           $0.background(Color.red)
       }
   }
}

struct Stateful: View {
   @State var input: String = ""
   var body: some View {
       TextField("My Field", text: $input)
           .frame(width: 200, height: 50)
   }
}

extension View {
   @ViewBuilder
   func applyIf<M: View>(condition: Bool, transform: (Self) -> M) -> some View {
       if condition {
           transform(self)
       } else {
           self
       }
   }
}
