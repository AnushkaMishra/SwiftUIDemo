//
//  SmallerDependencyProblem.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

struct Dog {
    var name: String
    var treat: Treat
    var image: Image
}

enum Treat: String, CaseIterable {
    case buiscuit
    case cucumber
    case pedigree
    case nuggets
}

struct ScalableDogImageParentProblem: View {
    @State var dog: Dog
    var body: some View {
        ScalableDogImageProblem(dog: dog)
            .id(dog.name)
        Button (action: {
            dog.treat = Treat.allCases.randomElement() ?? .buiscuit
        }, label: {
            Text("Change treat")
        })
        
    }
}

struct ScalableDogImageProblem: View {
    @State private var scaleToFill = false
    @State var dog: Dog
    
    var body: some View {
        let _ = Self._printChanges()
        dog.image
            .resizable()
            .aspectRatio(contentMode: scaleToFill ? .fill : .fit)
            .frame(maxHeight: scaleToFill ? 500 : nil)
            .padding(.vertical, 16)
            .onTapGesture {
                withAnimation {
                    scaleToFill.toggle()
                }
            }
    }
}

/*
  // Resolve this with EQUATABLE:

 struct ScalableDogImage: View, Equatable {
     @State private var scaleToFill = false
     let dog: Dog
 
     var body: some View/* */{
         let _ = Self._printChanges()
         Text(dog.name)
     }
 
     static func == (lhs: Self, rhs: Self) -> Bool {
         lhs.dog.name == rhs.dog.name
     }
 }

 */
