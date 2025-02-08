//
//  ScorecardView.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 02/02/25.
//

import SwiftUI

struct ScorecardView: View {
    @Binding var scorecard: Scorecard
    
    var body: some View {
        VStack{
            ForEach(scorecard.phrases) { phrase in
                Button(){
                    print(phrase.text)
                    phrase.status.toggle()
                    print(phrase.status)
                } label: {
                    Text(phrase.text)
                        .font(.title2)
                        .bold()
                }
            }
        }
    }
}
