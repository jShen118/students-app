//
//  StudentRow.swift
//  Students
//
//  Created by Joshua Shen on 10/17/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct StudentRow: View {
    var student: Student
    
    var body: some View {
        HStack {
            Image(student.lastName).resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Spacer()
            VStack {
                Text("\(student.lastName), \(student.firstName)")
                    .bold()
                Text("\(student.grade)th Grade")
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(student.averageScore)%")
        }
    }
}

struct StudentRow_Previews: PreviewProvider {
    static var previews: some View {
        StudentRow(student: Student("Jacko", "Lantern", 9, 92))
    }
}
