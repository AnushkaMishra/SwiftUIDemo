//
//  ViewUpdates.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 01/12/24.
//

import SwiftUI

struct ScalableDogImageParentSolution: View {
    @State var dog: Dog
    var body: some View {
        ScalableDogImageSolution(image: dog.image)
            .id(dog.name)
        Button (action: {
            dog.treat = Treat.allCases.randomElement() ?? .buiscuit
        }, label: {
            Text("Change treat")
        })
        
    }
}

struct ScalableDogImageSolution: View {
    @State private var scaleToFill = false
    var image: Image
    
    var body: some View {
        let _ = Self._printChanges()
        image
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


