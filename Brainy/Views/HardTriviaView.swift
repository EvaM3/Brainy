//
//  HardTriviaView.swift
//  Brainy
//
//

import SwiftUI

struct HardTriviaView: View {
    
    @EnvironmentObject var  triviaHardLevel: TriviaManagerHardLevel
    var body: some View {
        
        if triviaHardLevel.reachedEnd {
            VStack(spacing: 20) {
                Text("Brainy")
                    .lilacTitle()
                
                Text("Congratualtions, you completed the game! ✨")
                
                Text("You scored \(triviaHardLevel.score) out of \(triviaHardLevel.length)")
                
                Button {
                    Task.init {
                        await triviaHardLevel.fetchTrivia()
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
            HardQuestionView()
                .environmentObject(triviaHardLevel)
        }
    }
}



struct HardTriviaView_Previews: PreviewProvider {
    static var previews: some View {
        HardTriviaView()
            .environmentObject(TriviaManagerHardLevel())
    }
}
