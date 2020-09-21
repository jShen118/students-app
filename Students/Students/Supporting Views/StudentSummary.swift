//
//  StudentSummary.swift
//  Students
//
//  Created by Joshua Shen on 10/24/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct StudentSummary: View {
    var selectedStudents: [Student]
    var selectedAverage: Int
    @EnvironmentObject var studentData: StudentData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("# of selected students: \(selectedStudents.count)")
            Text("# of all students: \(studentData.students.count)")
            Text("average score of selected: \(selectedAverage)")
            Text("average score of all students: \(studentData.averageScore)")
        }.foregroundColor(.purple)
    }
}
/*
struct StudentSummary_Previews: PreviewProvider {
    static var previews: some View {
        StudentSummary()
    }
}*/
