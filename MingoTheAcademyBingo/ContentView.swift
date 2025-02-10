//
//  ContentView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var scorecard: Scorecard = Scorecard()
    
    var body: some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Mingo")
                        .bold()
                        .font(.system(size: 70))
                    Text("The academy Bingo")
                        .frame(width: 100, alignment: .center)
                        .font(.system(size: 25))
                }
                ScorecardView(scorecard: $scorecard)
            }
        }
    }
}

#Preview {
    ContentView()
}
