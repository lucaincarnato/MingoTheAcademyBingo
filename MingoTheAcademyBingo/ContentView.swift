//
//  ContentView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var scorecardOne: Scorecard = Scorecard()
    @State var scorecardTwo: Scorecard = Scorecard()
    
    var body: some View {
        VStack {
            ScorecardView(scorecard: $scorecardOne)
            Text("----------------------------------")
            ScorecardView(scorecard: $scorecardTwo)
            Text("----------------------------------")
            Button("Finish") {
                print(scorecardOne.check(with: scorecardTwo))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
