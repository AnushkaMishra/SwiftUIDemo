//
//  ConditionalHierarchySolutionTwo.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

struct ConditionalHierarchySolutionTwo: View {
   @State var flag: Bool = false
   var body: some View {
       SampleTwo(flag: flag)
       Button("Switch") {
           flag.toggle()
       }
   }
}

struct SampleTwo: View {
    var flag: Bool
    var body: some View {
        Stateful()
            .background(flag ? .red : .clear)
    }
}
