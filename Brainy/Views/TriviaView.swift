//
//  TriviaView.swift
//  TriviaGame
//
//  Created by Eva Sira Madarasz on 27/02/2024.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Brainy")
                    .lilacTitle()
                
                Text("Congratualtions, you completed the game! ✨")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    Task.init {
                        await triviaManager.fetchTrivia()
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
            QuestionView()
                .environmentObject(self.triviaManager)
        }
        
    }
    
    struct TriviaView_Previews: PreviewProvider {
        static var previews: some View {
            TriviaView()
                .environmentObject(TriviaManager())
        }
    }
}
