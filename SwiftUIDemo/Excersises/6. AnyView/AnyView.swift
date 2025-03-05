//
//  AnyView.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 20/01/25.
//

import SwiftUI

struct AnyItemView: View {
    let item: Item
    @State var flag: Bool = false
    var body: some View {
        AnyView(Text(item.text))
    }
}

struct NormalListView: View {
    var items: [Item]
    
    var body: some View {
        List(items) { item in
            NormalItemView(item: item)
        }.listStyle(.plain)
    }
}

struct AnyListView: View {
    var items: [Item]
    
    var body: some View {
        List(items) { item in
            AnyItemView(item: item)
        }.listStyle(.plain)
    }
}

struct AnyViewBootCamp: View {
    private var model = Model.shared
    @State private var startTime: Date?
    @State private var elapsedTime: TimeInterval?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink { NormalListView(items: model.items50K).onAppear {
                    measureTime("NormalListView")
                } } label: { Text("NormalView 50K").simultaneousGesture(TapGesture().onEnded {
                    startTime = Date() // Capture the time when the link is tapped
                }) }
                
                NavigationLink { AnyListView(items: model.items50K).onAppear {
                    measureTime("AnyListView")
                } } label: { Text("AnyView 50K").simultaneousGesture(TapGesture().onEnded {
                    startTime = Date() // Capture the time when the link is tapped
                }) }
            }
        }
    }
    private func measureTime(_ listView: String) {
        if let start = startTime {
            elapsedTime = Date().timeIntervalSince(start)
            print("Time taken to open \(listView): \(elapsedTime ?? 0) seconds")
            // Reset the start time for the next tap
            startTime = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewBootCamp()
    }
}

/*
 AnyView - nemesis of structural identity
 
 * we recommend avoid anyview if possible -
 -     make code harder to understand
 -     fewer compile time diagnostics
 -     using anyview when you don't need to will result in worst performance. Use generics to preserve static type info rather than passing anyviews around code
 
 AnyView is a type-erased wrapper around any view. It allows you to store multiple types of views in a single collection or return them from functions with a single return type.
 Since it erases the type, AnyView can introduce a small performance overhead. However, it’s often the most straightforward solution for cases requiring heterogeneous views.
 
 */
