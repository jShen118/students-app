//
//  StudentList.swift
//  Students
//
//  Created by Joshua Shen on 10/24/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct StudentList: View {
    var selectedStudents: [Student]
    @Binding var searchText: String
    
    var body: some View {
        List {
            ForEach(selectedStudents.sorted(by: <)) { student in
                if student.lastName.contains(self.searchText) || student.firstName.contains(self.searchText) || self.searchText == "" {
                    NavigationLink(destination: StudentDetail(student: student)) {
                        StudentRow(student: student)
                    }
                }
            }
        }.navigationBarTitle("Students")
    }
}
/*
struct StudentList_Previews: PreviewProvider {
    static var previews: some View {
        StudentList()
    }
}*/
