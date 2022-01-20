//
//  ContentView.swift
//  Memorize
//
//  Created by Sean Hong on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    var themes = [
        "vehicle_emojis": ["🚁", "🚇", "🚃", "🚀", "🚐", "🚙", "🚌", "🚅", "🚆",
                  "🛴", "🚜", "🛳", "✈️","🚠", "🚔", "🏎", "🚡", "🚞",
                  "🚕", "🏍", "🚢", "🛺", "⛴", "🚲"],
    
        "clothes_emojis": ["🥋", "🥻", "🥼", "🦺", "🧢", "🧥", "👖", "🧦", "🩱",
                          "🩲", "🩳", "👔", "🧤", "👗", "👘", "👙", "👕"],
    
        "sports_emojis": ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏",
                         "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🪃", "🥅"]
    ]
    
    @State var currentTheme : String = "clothes_emojis"
    var body: some View {
        VStack{
            Text("Memorize!")
                .padding(.horizontal)
                .foregroundColor(.blue)
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(themes[currentTheme]![0..<themes[currentTheme]!.count], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            getThemeTab.padding(.horizontal).font(.title)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var getThemeTab : some View {
        HStack {
            VStack {
                Image(systemName: "car.fill").foregroundColor(.blue)
                Text("Vehicle").font(.body).foregroundColor(.blue)
            }.padding([.top, .leading, .trailing]).onTapGesture {
                currentTheme = "vehicle_emojis"
            }
            VStack {
                Image(systemName: "person.fill").foregroundColor(.blue)
                Text("Clothes").font(.body).foregroundColor(.blue)
            }.padding([.top, .leading, .trailing]).onTapGesture {
                currentTheme = "clothes_emojis"
            }
            VStack {
                Image(systemName: "sportscourt.fill").foregroundColor(.blue)
                Text("Sports").font(.body).foregroundColor(.blue)
            }.padding([.top, .leading, .trailing]).onTapGesture {
                currentTheme = "sports_emojis"
            }
        }
    }
}

private struct CardView : View {
    var content : String
    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 25.0, style: .circular)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
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
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
