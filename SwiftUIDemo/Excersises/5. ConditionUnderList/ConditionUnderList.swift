//
//  ConditionUnderListProblem.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

struct NormalListViewWithConditionProblem: View {
    var items: [Item]
    
    var body: some View {
        List(items) { item in
            if item.id.isMultiple(of: 10) {
                NormalItemView(item: item)
            }
        }.listStyle(.plain)
    }
}

struct NormalListViewWithConditionSolution: View {
    var items: [Item]
    
    var body: some View {
        List(items) { item in
            NormalItemView(item: item)
        }.listStyle(.plain)
    }
}

struct ConditionUnderListView: View {
    private var model = Model.shared
    @State private var startTime: Date?
    @State private var elapsedTime: TimeInterval?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink { NormalListViewWithConditionProblem(items: model.items50K).onAppear {
                    measureTime("NormalListViewWithCondition")
                } } label: { Text("ListView with conditional statement - 50K").simultaneousGesture(TapGesture().onEnded {
                    startTime = Date() // Capture the time when the link is tapped
                }) }
                
                NavigationLink { NormalListViewWithConditionSolution(items: model.items50K).onAppear {
                    measureTime("NormalListViewWithCondition")
                } } label: { Text("NormalListViewWithCondition 50K").simultaneousGesture(TapGesture().onEnded {
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

class Model {
    static let shared = Model()
    let items50K = (0 ..< 50_000).map { Item(id: $0) }
}

struct Item: Identifiable {
    var id: Int
    var text: String { String(id) }
}

struct NormalItemView: View {
    let item: Item
    
    var body: some View {
        Text(item.text)
    }
}

/*
 After repeating it multiple times, the highest and least time taken to load list by NormalListViewWithCondition is more than NormalListView. This difference is visible without any doubt in Instrument - profiling where NormalListViewWithCondition shows hang
 */
