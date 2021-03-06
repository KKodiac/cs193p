//
//  ContentView.swift
//  Memorize
//
//  Created by Sean Hong on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    var themes = [
        "vehicle_emojis": ["π", "π", "π", "π", "π", "π", "π", "π", "π",
                  "π΄", "π", "π³", "βοΈ","π ", "π", "π", "π‘", "π",
                  "π", "π", "π’", "πΊ", "β΄", "π²"],
    
        "clothes_emojis": ["π₯", "π₯»", "π₯Ό", "π¦Ί", "π§’", "π§₯", "π", "π§¦", "π©±",
                          "π©²", "π©³", "π", "π§€", "π", "π", "π", "π"],
    
        "sports_emojis": ["β½οΈ", "π", "π", "βΎοΈ", "π₯", "πΎ", "π", "π", "π₯",
                         "π±", "πͺ", "π", "πΈ", "π", "π", "π₯", "πͺ", "π₯"]
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
                    ForEach(themes[currentTheme]!.shuffled()[0..<themes[currentTheme]!.count], id: \.self) { emoji in
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
                Text("Vehicle").font(.caption).foregroundColor(.blue)
            }.padding(.horizontal).onTapGesture {
                currentTheme = "vehicle_emojis"
            }
            VStack {
                Image(systemName: "person.fill").foregroundColor(.blue)
                Text("Clothes").font(.caption).foregroundColor(.blue)
            }.padding(.horizontal).onTapGesture {
                currentTheme = "clothes_emojis"
            }
            VStack {
                Image(systemName: "sportscourt.fill").foregroundColor(.blue)
                Text("Sports").font(.caption).foregroundColor(.blue)
            }.padding(.horizontal).onTapGesture {
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
