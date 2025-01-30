//
//  EquatableViewSolution.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/01/25.
//

import SwiftUI

//EQUATABLE: This method only affects the comparison of instances of view types and does not affect the refresh generated by property wrappers that conform to the DynamicProperty protocol.

struct EquatableViewSolution: View{
    @State var student = Student(name: "Joe", age: 88)
    var body: some View{
        VStack{
            StudentNameViewSolution(student: student)
            StudentAgeView(student: student)
            Button("random age"){
                student.age = Int.random(in: 0...99)
            }
        }
    }
}

struct StudentNameViewSolution: View, Equatable {
    let student: Student
    
    var body: some View {
        let _ = Self._printChanges()
        Text(student.name)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.student.name == rhs.student.name
    }
}
