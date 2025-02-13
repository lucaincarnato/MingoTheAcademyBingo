//
//  BingoView.swift
//  MingoTheAcademyBingo
//
//  Created by Luca Maria Incarnato on 13/02/25.
//

import SwiftUI

struct BingoView: View {
    @State var scorecard: Scorecard
    var save: () throws -> Void
    
    var body: some View {
        ZStack{
            Color.accentColor
                .ignoresSafeArea()
            Image("bingo")
                .resizable()
                .scaledToFit()
        }
        .onAppear {
            DispatchQueue.main.async {
                scorecard.setNew()
                try? save()
            }
        }
    }
}
