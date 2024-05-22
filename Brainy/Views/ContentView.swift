//
//  ContentView.swift
//  TriviaGame
//
//  Created by Eva Sira Madarasz on 15/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var triviaManager = TriviaManager()
    @StateObject var triviaMediumLevel = TriviaManagerMediumLevel()
    @StateObject var triviaHardLevel = TriviaManagerHardLevel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Brainy")
                        .lilacTitle()
                    
                    
                    Text("Are you ready to test out your knowledge?")
                    Text("Which level is yours?")
                        .foregroundColor(Color("AccentColor"))
                    
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Easy level")
                        .glow()
                }
                                .padding(10)
                
                                NavigationLink {
                                    TriviaView()
                                        .environmentObject(triviaMediumLevel)
                                } label: {
                                    PrimaryButton(text: "Medium level")
                                        .glow()
                                }
                                .padding(10)
                
                                NavigationLink {
                                    TriviaView()
                                        .environmentObject(triviaHardLevel)
                                } label: {
                                    PrimaryButton(text: "Hard level")
                                        .glow()
                                }
                            }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

