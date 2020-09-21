//
//  ContentView.swift
//  Students
//
//  Created by Joshua Shen on 10/17/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var picked: LetterGrade = .All
    @State private var searchText = ""
    @State private var adding = false
    @EnvironmentObject var studentData: StudentData
    
    var selectedStudents: [Student] {
        if picked == .All {return studentData.students}
        return studentData.students.filter{$0.letterGrade == picked}
    }
    var selectedAverage: Int {
        return selectedStudents.reduce(0, {$0 + $1.averageScore})/selectedStudents.count
    }
    
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    TextField("Type your search",text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.purple, width: 1)
                    GradePicker(picked: $picked)
                    StudentList(selectedStudents: selectedStudents, searchText: $searchText)
                    Divider()
                    HStack {
                        StudentSummary(selectedStudents: selectedStudents, selectedAverage: selectedAverage)
                        Button(action: {self.adding.toggle()}) {
                            Text("Add Student")
                        }
                    }
                }
            }.disabled(adding)
            
            if adding {
                StudentCreator(adding: $adding)
                    .animation(.spring())
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        .environmentObject(StudentData())
    }
}
