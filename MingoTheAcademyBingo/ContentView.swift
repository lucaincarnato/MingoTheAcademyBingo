//
//  ContentView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 01/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [Scorecard]

    var scorecard: Scorecard? {
        items.first ?? Scorecard()
    }
    @State var won: Bool = false
    
    var body: some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            VStack {
                Image("title")
                    .resizable()
                    .scaledToFit()
                ScorecardView(scorecard: scorecard!, won: $won, save: context.save)
            }
        }
        .onAppear() {
            context.insert(scorecard!)
            try? context.save()
        }
        .sheet(isPresented: $won) {
            Text("YOU WON")
        }
    }
}

#Preview {
    ContentView()
}
