//
//  ScorecardView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 02/02/25.
//

import SwiftUI

struct ScorecardView: View {
    @Binding var scorecard: Scorecard
    
    let rows = [
        GridItem(.fixed(30), spacing: 35),
        GridItem(.fixed(30), spacing: 35),
        GridItem(.fixed(30), spacing: 35),
        GridItem(.fixed(30), spacing: 35),
    ]
    
    var body: some View {
        VStack{
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(scorecard.phrases) { phrase in
                    Button(){
                        phrase.status.toggle()
                    } label: {
                        Text(phrase.text)
                            .font(.title2)
                            .bold()
                            .frame(width: 50, height: 50)
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(Color.black)
                }
            }
        }
    }
}
