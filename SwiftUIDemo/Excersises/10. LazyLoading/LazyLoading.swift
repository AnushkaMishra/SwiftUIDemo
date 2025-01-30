//
//  10. lazy.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 28/01/25.
//

import SwiftUI

struct Profile: Identifiable {
    let id: Int
    let imageName: String
}

let sytemNames = ["square.and.arrow.up", "heart.fill", "arrowshape.left", "arrowshape.left.fill", "arrowshape.right", "figure.walk", "play.fill"]

// For lazy components, only the ones that are visible on screen are loaded. As opposed to loading all of them at once and keeping them in memory

struct LazyView: View {
    @State var profiles: [Profile] = Array<Int>(1...6000)
        .map{number in return Profile(id: number, imageName: sytemNames.randomElement()!)}
    var body: some View {
        ScrollView(.horizontal) {
            HStack { // Use LazyHStack in this place to fix slow response
                ForEach(profiles) { profile in
                    ProfileView(profile: profile)
                }
            }
        }
        .frame(maxWidth: 500)
        .onAppear {
            print("OnAppear called")
        }
    }
}

struct ProfileView: View {
    let profile: Profile
    
    var body: some View {
        Image(systemName: profile.imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .onAppear() {
                print("ProfileView OnAppear called for \(profile.id)")
            }
    }
}
