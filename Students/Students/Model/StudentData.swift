//
//  StudentData.swift
//  Students
//
//  Created by Joshua Shen on 10/17/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import Foundation

final class StudentData: ObservableObject {
    @Published var students = [
        Student("James", "Smith", 9, 92),
        Student("Mary", "Johnson", 9, 75),
        Student("John", "Williams", 9, 64),
        Student("Patricia", "Brown", 9, 80),
        Student("Robert", "Jones", 10, 60),
        Student("Jennifer", "Garcia", 10, 96),
        Student("Michael", "Miller", 10, 84),
        Student("Linda", "Davis", 10, 77),
        Student("William", "Rodriguez", 11, 63),
        Student("Elizabeth", "Martinez", 11, 82),
        Student("David", "Hernandez", 11, 98),
        Student("Barbara", "Lopez", 11, 70),
        Student("Richard", "Gonzalez", 12, 90),
        Student("Susan", "Wilson", 12, 88),
        Student("Joseph", "Anderson", 12, 71)
    ]
    
    var averageScore: Int {
        var total = 0
        for s in students {total += s.averageScore}
        return total/students.count
    }
}

