//
//  GradePicker.swift
//  Students
//
//  Created by Joshua Shen on 10/19/19.
//  Copyright © 2019 Joshua Shen. All rights reserved.
//

import SwiftUI

struct GradePicker: View {
    @Binding var picked: LetterGrade
    
    var body: some View {
        Picker(selection: $picked, label: Text("")) {
            Text("A").tag(LetterGrade.A)
            Text("B").tag(LetterGrade.B)
            Text("C").tag(LetterGrade.C)
            Text("D").tag(LetterGrade.D)
            Text("All").tag(LetterGrade.All)
        } .pickerStyle(SegmentedPickerStyle())
    }
}

/*
struct GradePicker_Previews: PreviewProvider {
    static var previews: some View {
        GradePicker(picked: <#Binding<LetterGrade>#>)
    }
}
*/
