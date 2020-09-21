//
//  StudentCreator.swift
//  Students
//
//  Created by Joshua Shen on 10/24/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct StudentCreator: View {
    @Binding var adding: Bool
    @State var firstName = ""
    @State var lastName = ""
    @State var grade = 9
    @State var averageScore = 100
    @EnvironmentObject var studentData: StudentData
    
    func resetStudent() {
        firstName = ""
        lastName = ""
        grade = 9
        averageScore = 100
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {self.adding.toggle()}) {
                    Text("Cancel")
                }
                Spacer()
            }
            Text("New Student").font(.title).bold()
            Group {
                HStack {
                    Text("First Name")
                    TextField("Type first name here", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.purple, width: 1)
                }
                HStack {
                    Text("Last Name")
                    TextField("Type last name here", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.purple, width: 1)
                }
            }
            
            Spacer()
            Text("Grade Level")
            Picker(selection: $grade, label: Text("")) {
                Text("9").tag(9)
                Text("10").tag(10)
                Text("11").tag(11)
                Text("12").tag(12)
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
            Text("Average Score")
            Picker(selection: $averageScore, label: Text("")) {
                ForEach(0..<101) { n in
                    Text("\(n)").tag(n)
                }
            }.frame(width: 50)
            Button(action: {
                self.studentData.students.append(Student(self.firstName, self.lastName, self.grade, self.averageScore))
                self.resetStudent()
                self.adding.toggle()
            }) {Text("Create Student")}
        }
        .frame(width: 350, height: 600)
        .padding(10)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple, lineWidth: 5)
        )
    }
}

/*
struct StudentCreator_Previews: PreviewProvider {
    @State var adding = true
    
    static var previews: some View {
        StudentCreator(adding: $adding)
    }
}*/
