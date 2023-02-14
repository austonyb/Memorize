//
//  ContentView.swift
//  Memorize
//
//  Created by Auston Youngblood on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojiSet = [["🚗", "🛳️", "🚔", "🛸", "✈️", "🚀", "🛫", "🏎️", "🚎", "🚨", "🚍", "🦼", "🚠", "🗿", "🚁", "💺", "🛴", "🩼", "🚂", "🛵", "🛞", "💻", "🌯", "🚴‍♀️"], ["🏖️", "🌋", "🏔️", "⛺️", "🌅", "🌊", "🌎", "🌨️", "🌪️", "🌞", "🌵", "🪵", "🌷", "🌝", "🌖", "🌸", "🔥", "⚡️", "☄️", "💦", "❄️", "🌻", "🐲", "🦃"], ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥌", "🏂", "🪃", "⛸️", "🚵‍♀️", "🎧", "🎮", "🧩", "🏆"]]
    
    
    
    @State var emojiCount: Int = 20
    @State var emojiTheme: Int = 0
    
   
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    var chosenEmojiSet = emojiSet[emojiTheme].shuffled()
                    //emojiTheme should be a number between 0...2
                    ForEach(chosenEmojiSet[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            HStack(alignment: .center){
                themeOne
                Spacer()
                themeTwo
                Spacer()
                themeThree
            }
            .font(.largeTitle)
            .padding()
            
        }
        .padding(.horizontal)
    }
    
    var themeOne: some View {
        VStack {
            Text("Transportation")
                .font(.caption)
            Button {
                emojiTheme = 0
            } label: {
                Image(systemName: "tram.circle")
        }
        }
        
    }
    
    var themeTwo: some View {
        VStack {
            Text("Nature")
                .font(.caption)
            Button {
                emojiTheme = 1
            } label: {
                Image(systemName: "tree.circle")
        }
        }
    }
    
    var themeThree: some View {
        VStack {
            Text("Activity")
                .font(.caption)
            Button {
                emojiTheme = 2
            } label: {
                Image(systemName: "figure.run.circle")
        }
        }
    }
}

struct CardView: View {
    var content: String
    //@State is a pointer.
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
