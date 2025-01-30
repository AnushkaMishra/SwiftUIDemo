//
//  Redacted.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 29/01/25.
//
import SwiftUI

struct Article {
    let title: String
    let author: String
}

struct RedactedView: View {
    @State var article: Article?
    @State var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article?.title ?? .placeholder(length: 11))
                .font(.headline)
            Text(article?.author ?? .placeholder(length: 7))
                .font(.subheadline)
            Text("Keep this visible")
                .font(.caption)
                .italic()
                .unredacted()
                        
            TextField(text: $text) {
                Text("redacted: invalidated")
            }.redacted(reason: !text.isEmpty ? [] : .invalidated)
            
            
            TextField(text: $text) {
                Text("redacted: Privacy")
            }.redacted(reason: !text.isEmpty ? [] : .privacy)
            
            Button {
                Task {
                    reset()
                    await setValues()
                }
            } label: {
                Text("Reset")
            }
            
        }.padding()
            .redacted(reason: article == nil ? .placeholder : [])
            .task {
                await setValues()
            }
    }
    
    private func setValues() async {
        try? await Task.sleep(for: .seconds(3))
        self.article = Article(title: "Hello World", author: "Anushka")
        self.text = "Hello"
    }
    
    private func reset() {
        self.article = nil
        self.text = ""
    }
}

#Preview {
    RedactedView()
}
extension String {
    static func placeholder(length: Int) -> String {
        String(Array(repeating: "X", count: length))
    }
}

func foreachTest() {
    let items = ["a", "b", "c", "d"]
    for item in items.enumerated() where item.1.elementsEqual("a") {
        
    }
}
