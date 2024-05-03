//
//  ContentView.swift
//  War Card Game
//
//  Created by Hiren Gandhi on 6/8/23.
//

import SwiftUI

struct ContentView: View {
    //represents the two image views that show the cards
    @State var playerCard = "card2" //modifies the var to state that it is a special property
    @State var cpuCard = "card3"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack{
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                //logo image for the war card game
                Image("logo")
                Spacer()
                
                
                HStack {
                    Spacer()
                    //player's card
                    Image(playerCard)
                    Spacer()
                    //CPU's card
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                //tapping the button will randomize the cards for both the player and cpu, at the same time updating the score of the player who won the round
                Button {
                    //references the function below where bulk of the logic is
                    deal()
                } label: { //This portion of the button code allows us to add visual representation
                    Image("button")
                }

                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("Player")
                            .font(.headline)
                            .padding()
                        
                        Text(String(playerScore)) //type cast integer to string to display as text
                            .font(.largeTitle)
                        
                    }
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("CPU")
                            .font(.headline)
                            .padding()
                        
                        Text(String(cpuScore))
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                    
                }
                .foregroundColor(.white)
                
                Spacer()
                
                
            }
            .padding(10)
        }
        
    }
    
    func deal() {
        //randomizing the player and cpu cards
        var playerCardValue = Int.random(in: 2...14)
        var cpuCardValue = Int.random(in: 2...14)
        // concatenating the two String, the randomized int gets converted to string
        playerCard = "card" + String(playerCardValue)
        cpuCard = "card" + String(cpuCardValue)
        
        //updating the scores
        if playerCardValue > cpuCardValue{
            //add 1 to player score
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue{
            //add 1 to cpu score
            cpuScore += 1
        }
        else{
            //TIE!
            playerScore += 1
            cpuScore += 1
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

