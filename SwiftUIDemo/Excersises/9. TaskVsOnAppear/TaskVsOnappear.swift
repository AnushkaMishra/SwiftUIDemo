//
//  9. TaskVsOnappear.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 28/01/25.
//

import SwiftUI
/*
 Task:
 1. Tasks initiated with .task are automatically canceled when the view disappears, ensuring that the task doesn't continue running unnecessarily.
 2. Use .task for performing asynchronous tasks, such as network requests or database queries. It allows you to run asynchronous code directly without wrapping it in a Task object.

 OnAppear:
 1. Does not cancel on its own
 2. Use .onAppear for synchronous functions or simple tasks that don't involve asynchronous work
 */

class TaskBootcampViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    
    init(image: UIImage? = nil) {
        self.image = image
    }
    
    func fetchImage() async {
        print("Fetch Image")
        await resetImage()
        try? await Task.sleep(for: .seconds(2))
        do {
            guard let url = URL(string: "https://imagej.net/images/2D_Gel.jpg") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            await MainActor.run {
                self.image = UIImage(data: data)
                print("IMAGE SET")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetImage() async {
        await MainActor.run {
            image = nil
        }
    }
}

struct TaskBootcampHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: TaskBootcamp()) {
                    Text("Task Bootcamp")
                }
                NavigationLink(destination: OnAppearBootcamp()) {
                    Text("OnAppear Bootcamp")
                }
            }
        }
        .navigationTitle("Screen 1")
    }
}
    
struct TaskBootcamp: View {
    @StateObject private var viewModel = TaskBootcampViewModel()
    @State private var recallTask: Bool = false
    var body: some View {
        VStack(spacing:40) {
            Image(uiImage: viewModel.image ?? .init(systemName: "photo.artframe")!).resizable()
                .scaledToFit ()
                .frame(width: 200, height: 200)
                .redacted(reason: viewModel.image == nil ? .placeholder : [])
            
            NavigationLink("Go to Screen 3") {
                TaskBootcampScreen3()
            }
            
            Button {
                Task {
                    await fetchImage()
                }
            } label: {
                Text("Recall task")
            }
        }
        .navigationTitle("Screen 2")
        .task {
            await fetchImage()
        }
    }
    
    func fetchImage() async {
        await viewModel.fetchImage()
    }
}

struct OnAppearBootcamp: View {
    @StateObject private var viewModel = TaskBootcampViewModel()
    
    var body: some View {
        VStack(spacing:40) {
            Image(uiImage: viewModel.image ?? .init(systemName: "photo.artframe")!).resizable()
                    .scaledToFit ()
                    .frame(width: 200, height: 200)
                    .redacted(reason: viewModel.image == nil ? .placeholder : [])
            
            NavigationLink("Go to Screen 3") {
                TaskBootcampScreen3()
            }
            
            Button {
                callTask()
            } label: {
                Text("Recall task")
            }
        }
        .onAppear {
            callTask()
        }
        .navigationTitle("Screen 2")
    }
    
    private func callTask() {
        Task {
            await viewModel.fetchImage()
        }
    }
}

struct TaskBootcampScreen3: View {
    var body: some View {
        Text("Screen 3")
    }
}
