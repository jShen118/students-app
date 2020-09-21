//
//  StudentDetail.swift
//  Students
//
//  Created by Joshua Shen on 10/17/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct StudentDetail: View {
    @EnvironmentObject var studentData: StudentData
    var student: Student
    
    var studentIndex: Int {
        studentData.students.firstIndex(where: { $0.id == student.id })!
    }
    
    var percentile: Int {
        var numGreaterThan = 0
        for s in studentData.students {
            if student.averageScore > s.averageScore {numGreaterThan += 1}
        }
        return 100*numGreaterThan/studentData.students.count
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(student.lastName).resizable()
                .frame(width: 350, height: 350)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 10))
            Text("\(student.firstName) \(student.lastName)")
                .bold()
                .font(.title)
                .padding(11)
            Spacer()
            Text("\(student.grade)th Grade")
            Spacer()
            Text("Average Score: \(studentData.students[studentIndex].averageScore)%, \(studentData.students[studentIndex].letterGrade.rawValue)")
            Text("\(percentile)th percentile")
            Picker(selection: $studentData.students[studentIndex].averageScore, label: Text("Average Score").bold()) {
                ForEach(0..<101) { n in
                    Text("\(n)").tag(n)
                }
            }
        }
    }
}
/*
struct StudentDetail_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetail(student: StudentData().students[0])
            .environmentObject(StudentData())
    }
}*/
