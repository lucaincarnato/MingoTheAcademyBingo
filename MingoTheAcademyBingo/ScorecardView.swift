//
//  ScorecardView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 02/02/25.
//

import SwiftUI

struct ScorecardView: View {
    @Binding var scorecard: Scorecard
    @Binding var won: Bool
    
    let cellSize = UIScreen.main.bounds.width / 4
    let rows = [
        GridItem(.fixed(1.4137 * UIScreen.main.bounds.width / 4), spacing: 0),
        GridItem(.fixed(1.4137 * UIScreen.main.bounds.width / 4), spacing: 0),
        GridItem(.fixed(1.4137 * UIScreen.main.bounds.width / 4), spacing: 0),
        GridItem(.fixed(1.4137 * UIScreen.main.bounds.width / 4), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(scorecard.phrases) { phrase in
                    Button {
                        phrase.status = true
                        won = scorecard.bingo()
                    } label: {
                        ZStack {
                            Image("placeholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: cellSize, height: cellSize)
                            
                            Color.green.opacity(phrase.status ? 0.5 : 0)
                        }
                    }
                    .frame(width: cellSize, height: cellSize)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
