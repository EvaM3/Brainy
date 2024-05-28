//
//  HardAnswerRow.swift
//  Brainy
//

//

import SwiftUI

struct HardAnswerRow: View {
    @EnvironmentObject var triviaHardManager: TriviaManagerHardLevel
    var answer: Answer
    @State private var isSelected = false
    
    // Custom colors
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaHardManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? answer.isCorrect ? green : red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaHardManager.answerSelected {
                isSelected = true
                triviaHardManager.selectAnswer(answer: answer)

            }
        }
    }
}


struct HardAnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        HardAnswerRow(answer: Answer(answerId: "", text: "Happy", isCorrect:  true))
            .environmentObject(TriviaManagerMediumLevel())
    }
}
