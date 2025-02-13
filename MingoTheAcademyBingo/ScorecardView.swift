//
//  ScorecardView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 02/02/25.
//

import SwiftUI

struct ScorecardView: View {
    @State var scorecard: Scorecard
    @Binding var won: Bool
    var save: () throws -> Void
    
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
                        phrase.status.toggle()
                        won = scorecard.bingo()
                        if phrase.rotation == 0 { phrase.rotation = Double.random(in: 1..<360) }
                        try? save()
                    } label: {
                        ZStack {
                            Image("\(phrase.text)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: cellSize, height: cellSize)
                                .overlay(){
                                    if phrase.status {
                                        Rectangle()
                                            .fill(Color.black.opacity(0.3))
                                            .frame(width: cellSize, height: 1.4137*cellSize)
                                        Image("stamp")
                                            .resizable()
                                            .frame(width: cellSize - 30, height: cellSize - 30)
                                            .rotationEffect(Angle(degrees: phrase.rotation))
                                    }
                                }
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
