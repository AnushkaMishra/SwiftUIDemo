//
//  AvoidBundleLookup.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 21/01/25.
//

import SwiftUI

struct AvoidBundleLookupProblem: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text(lookupString("greeting") + " \(counter)") // Expensive lookup
                .padding()
            Button("Increment") {
                counter += 1
            }
        }
    }
    
}

func lookupString(_ key: String) -> String {
    // Simulate an expensive lookup
    
    let start = Date() // Start time
    let result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)
    let duration = Date().timeIntervalSince(start) // Calculate duration
        print("Lookup for \(key) took \(duration * 1000) milliseconds")
    return result
}

//Possible Fix:

struct ContentViewBundleLookupFix: View {
    @State private var counter = 0
    private let greeting: String
    
    init() {
        // Perform the lookup once during initialization
        self.greeting = Bundle.main.localizedString(forKey: "greeting", value: nil, table: nil)
    }
    
    var body: some View {
        VStack {
            Text(greeting + " \(counter)") // Expensive lookup
                .padding()
            Button("Increment") {
                counter += 1
            }
        }
    }
}

#Preview {
    ContentViewBundleLookupFix()
}
