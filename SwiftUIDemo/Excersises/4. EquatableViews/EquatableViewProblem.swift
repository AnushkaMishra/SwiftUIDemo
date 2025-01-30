//
//  EquatableViews.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 23/01/25.
//

import SwiftUI

struct EquatableViewProblem: View{
    @State var student = Student(name: "Joe", age: 88)
    var body: some View{
        VStack{
            StudentNameViewProblem(student: student)
            StudentAgeView(student: student)
            Button("random age"){
                student.age = Int.random(in: 0...99)
            }
        }
    }
}

struct StudentNameViewProblem: View {
    let student: Student
    
    var body: some View {
        let _ = Self._printChanges()
        Text(student.name)
    }
}

struct StudentAgeView: View {
    let student: Student
    var body: some View {
        let _ = Self._printChanges()
        Text(student.age, format: .number)
    }
}
