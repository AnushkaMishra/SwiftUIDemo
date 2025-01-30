//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Anushka Mishra on 30/10/24.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            IdentityScrollViewReader()

            //MARK: SmallerDependency
//            ScalableDogImageParentProblem(dog: .init(name: "Popo", treat: .buiscuit, image: .init(systemName: "dog.fill")))
//            ScalableDogImageParentSolution(dog: .init(name: "Popo", treat: .buiscuit, image: .init(systemName: "dog.fill")))

            //MARK: UnnecessaryDeclarations
//            UnnecessaryDeclarationsOne()
//            UnnecessaryDeclarationsTwo()
//            UnnecessaryDeclarationsThree()

            //MARK: ConditionalHierarchy
//            ConditionalHierarchyProblemOne()
//            ConditionalHierarchySolutionOne()
//            ConditionalHierarchyProblemTwo()
//            ConditionalHierarchySolutionTwo()
            
            //MARK: EquatableViews
//            EquatableViewProblem()
//            EquatableViewSolution()
            
            //MARK: ConditionUnderList
//            ConditionUnderListView()
            
            //MARK: AnyView
//            AnyViewBootCamp()

            //MARK: Closures
//            ClosureProblemOne()
//            ClosureSolutionOne()
//            ClosureProblemTwo()
//            ClosureSolutionTwo()

            //MARK: AvoidBundleLookup
//            AvoidBundleLookupProblem()

            //MARK: TaskVsOnAppear
//            TaskBootcampHomeView()
            
            //MARK: LazyView
//            LazyView()
            
            //MARK: Debounce
//            DebounceButtonView()
            
            //MARK: Throttle
//            ThrottleView()
            
            //MARK: Redacted
//            RedactedView()
        }
    }
}
