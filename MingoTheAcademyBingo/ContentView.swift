//
//  ContentView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var scorecard: Scorecard = Scorecard()
    @State var won: Bool = false
    
    var body: some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            VStack {
                Image("title")
                    .resizable()
                    .scaledToFit()
                ScorecardView(scorecard: $scorecard, won: $won)
            }
        }
        .sheet(isPresented: $won) {
            Text("YOU WON")
        }
    }
}

#Preview {
    ContentView()
}
