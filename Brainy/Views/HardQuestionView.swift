//
//  HardQuestionView.swift
//  Brainy
//
//  Created by Eva Sira Madarasz on 15/04/2024.
//

import SwiftUI

struct HardQuestionView: View {
    @EnvironmentObject var triviaHardManager: TriviaManagerHardLevel
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                    .lilacTitle()
                
                     Spacer()
                
                Text("\(triviaHardManager.index + 1) out of \(triviaHardManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: triviaHardManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaHardManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                
                ForEach(triviaHardManager.answerChoices, id: \.id) {
                    answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaHardManager)
                }
            }
            Button {
                triviaHardManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaHardManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!triviaHardManager.answerSelected)
           
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
    }
}

struct HardQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        HardQuestionView()
            .environmentObject(TriviaManagerHardLevel())
    }
}
