//
//  MediumTriviaView.swift
//  Brainy
//
//

import SwiftUI

struct MediumTriviaView: View {
    @EnvironmentObject var triviaMediumLevel: TriviaManagerMediumLevel
    
    var body: some View {
        if triviaMediumLevel.reachedEnd {
            VStack(spacing: 20) {
                Text("Brainy")
                    .lilacTitle()
                
                Text("Congratualtions, you completed the game! ✨")
                
                Text("You scored \(triviaMediumLevel.score) out of \(triviaMediumLevel.length)")
                
                Button {
                    Task.init {
                        await triviaMediumLevel.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            MediumQuestionView()
                   .environmentObject(triviaMediumLevel)
        }
    }
}



struct MediumTriviaView_Previews: PreviewProvider {
    static var previews: some View {
        MediumTriviaView()
            .environmentObject(TriviaManagerMediumLevel())
    }
}
