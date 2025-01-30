//
//  ClosureSolutionTwo.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

struct ClosureSolutionTwo: View {
    @StateObject var store = MyStore()
    var body: some View {
        VStack {
            if let currentID = store.selection {
                Text("Current ID: \(currentID)")
            }
            List {
                ForEach(0..<100) { i in
                    //Solution:
                    CellViewClosureFix(id: i, action: store.sendID(_:))
                }
            }
            .listStyle(.plain)
        }
    }
}

struct CellViewClosureFix: View {
    let id: Int
    var action: (Int) -> Void
    init(id: Int, action: @escaping (Int) -> Void) {
        self.id = id
        self.action = action
    }

    var body: some View {
        VStack {
            let _ = print("update \(id)")
            Button("ID: \(id)") {
                action(id)
            }
        }
    }
}
