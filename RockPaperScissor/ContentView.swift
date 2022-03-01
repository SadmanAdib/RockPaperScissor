//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Sadman Adib on 2/23/22.
//

import SwiftUI



struct ContentView: View {
    
    @State private var computerMove = ["Rock", "Paper", "Scissor"]
    @State private var computerMoveSelection = Int.random(in: 0...2)
  //  @State private var computerCommand = ["Win", "Loose"]
    @State private var Win = Bool.random() // Bool.random() doesn't seem to work :(
  //  @State private var computerCommandSelection = Int.random(in: 0...1)
    
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var score = 0
    
    @State private var questionCount = 1
    
    var body: some View {
        VStack(spacing: 30){
            Text("App Selected the following:").font(.subheadline.weight(.heavy))
            Text(computerMove[computerMoveSelection]).font(.largeTitle.weight(.semibold))
            Text("App challenges you to:").font(.subheadline.weight(.heavy))
            if Win{
                Text("Win").font(.largeTitle.weight(.semibold))
            }else{
                Text("Loose").font(.largeTitle.weight(.semibold))
            }
            Text("Your options to choose from:").font(.subheadline.weight(.heavy))
            
            HStack(spacing: 30){
                Button("Rock"){
                    rockButtonTapped()
                    questionCount+=1
                }
                
                Button("Paper"){
                    paperButtonTapped()
                    questionCount+=1
                }
                
                Button("Scissor"){
                    scissorButtonTapped()
                    questionCount+=1
                }
            }.alert(scoreTitle, isPresented: $showingScore){
                Button("continue", action: continueGame)
            }message: {
                if scoreTitle == "Success!"{
                    Text("Your score is \(score)")
                }
            }
            if showingFinalScore{
                Text("Score : \(score)").font(.subheadline.weight(.heavy))
            }
            
            
        }
    }
    
    func continueGame(){
        computerMove.shuffle()
        Win.toggle()
      //  computerCommand.shuffle()
        computerMoveSelection = Int.random(in: 0...2)
      //  computerCommandSelection = Int.random(in: 0...1)
    }
    
    func rockButtonTapped(){
        if computerMove[computerMoveSelection] == "Paper" && Win {
            //paper and win
            //score unchanged
            scoreTitle = "Failed"
        }
        else if computerMove[computerMoveSelection] == "Paper" && !Win {
            //paper and loose
            scoreTitle = "Success!"
            score+=1
        }
        else if computerMove[computerMoveSelection] == "Scissor" && Win{
            //scissor and win
            scoreTitle = "Success!"
            score+=1
        }
        else if computerMove[computerMoveSelection] == "Scissor" && !Win{
            //scissor and loose
            //score unchanged
            scoreTitle = "Failed"
        }
        else{
            scoreTitle = "Invalid Selection"
        }
        
       // showingScore = (questionCount == 10) ?  false : true
        
        if(questionCount != 10){
            showingScore = true
            showingFinalScore = false
        }
        else{
            showingScore = true
            showingFinalScore = true
            questionCount = 1
        }
    }
    
    func paperButtonTapped(){
        if computerMove[computerMoveSelection] == "Rock" && Win{
            //rock and win
            scoreTitle = "Success!"
            score+=1
        }
        else if computerMove[computerMoveSelection] == "Rock" && !Win{
            //rock and loose
            //score unchanged
            scoreTitle = "Failed"
        }
        else if computerMove[computerMoveSelection] == "Scissor" && Win{
            //scissor and win
            //score unchanged
            scoreTitle = "Failed"
        }
        else if computerMove[computerMoveSelection] == "Scissor" && !Win{
            //scissor and loose
            scoreTitle = "Success!"
            score+=1
        }
        else{
            scoreTitle = "Invalid Selection"
        }
        
        if(questionCount != 10){
            showingScore = true
            showingFinalScore = false
        }
        else{
            showingScore = true
            showingFinalScore = true
            questionCount = 1
        }
    }
    
    func scissorButtonTapped(){
        if computerMove[computerMoveSelection] == "Rock" && Win{
            //rock and win
            //score unchanged
            scoreTitle = "Failed"
        }
        else if computerMove[computerMoveSelection] == "Rock" && !Win{
            //rock and loose
            scoreTitle = "Success!"
            score+=1
        }
        else if computerMove[computerMoveSelection] == "Paper" && Win{
            //paper and win
            scoreTitle = "Success!"
            score+=1
        }
        else if computerMove[computerMoveSelection] == "Paper" && !Win{
            //paper and loose
            //score unchanged
            scoreTitle = "Failed"
        }
        else{
            scoreTitle = "Invalid Selection"
        }
        
        if(questionCount != 10){
            showingScore = true
            showingFinalScore = false
        }
        else{
            showingScore = true
            showingFinalScore = true
            questionCount = 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
