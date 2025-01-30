//
//  ClosureProblemTwo.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

struct ClosureProblemTwo: View {
    @StateObject var store = MyStore()
    var body: some View {
        VStack {
            if let currentID = store.selection {
                Text("Current ID: \(currentID)")
            }
            List {
                ForEach(0..<100) { i in
                    //Issue:
                    CellViewClosure(id: i) { store.sendID(i) }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct CellViewClosure: View {
    let id: Int
    var action: () -> Void
    init(id: Int, action: @escaping () -> Void) {
        self.id = id
        self.action = action
    }

    var body: some View {
        VStack {
            let _ = print("update \(id)")
            Button("ID: \(id)") {
                action()
            }
        }
    }
}

class MyStore: ObservableObject {
    @Published var selection:Int?

    func sendID(_ id: Int) {
        self.selection = id
    }
}
