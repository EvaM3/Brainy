//
//  MediumQuestionView.swift
//  Brainy
//
//

import SwiftUI

struct MediumQuestionView: View {
    @EnvironmentObject var triviaMediumManager: TriviaManagerMediumLevel
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                    .lilacTitle()
                
                     Spacer()
                
                Text("\(triviaMediumManager.index + 1) out of \(triviaMediumManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: triviaMediumManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaMediumManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                
                ForEach(triviaMediumManager.answerChoices, id: \.id) {
                    answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaMediumManager)
                }
            }
            Button {
                triviaMediumManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaMediumManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!triviaMediumManager.answerSelected)
           
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
    }
}



struct MediumQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MediumQuestionView()
            .environmentObject(TriviaManagerMediumLevel())
    }
}
