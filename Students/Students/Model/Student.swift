//
//  Student.swift
//  Students
//
//  Created by Joshua Shen on 10/17/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import Foundation
import SwiftUI

struct Student: Identifiable, Comparable {
    var id: Int
    static var next = 0
    
    let firstName: String
    let lastName: String
    let grade: Int
    var averageScore: Int
    var letterGrade: LetterGrade {
        switch averageScore {
        case 90...100: return .A
        case 80..<90: return .B
        case 70..<80: return .C
        case 60..<70: return .D
        default: return .All
        }
    }
    
    init(_ firstName: String, _ lastName: String, _ grade: Int, _ averageScore: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.grade = grade
        self.averageScore = averageScore
        self.id = Student.next
        Student.next += 1
    }
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}


