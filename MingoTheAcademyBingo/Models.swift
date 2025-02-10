//
//  Scorecard.swift
//  Mingo
//
//  Created by Luca Maria Incarnato on 02/02/25.
//

import Foundation
import SwiftUI

class Scorecard: Identifiable {
    var id: UUID = UUID()
    var phrases: [Phrase] // Set of phrases typical of a scorecard
    
    // TODO: iCloud INTEGRATION, TO BE REMOVED
    // String database from which get phrases
    var database: [String] = [
        "1", "2", "3", "4",
        "5", "6", "7", "8",
        "9", "10", "11", "12",
        "13", "14", "15", "16",
        "17", "18", "19", "20",
        "21", "22", "23", "24",
        "25", "26", "27", "28",
        "29", "30", "31", "32",
    ]
    
    // Get 16 random and not repetitive strings from the database and associate them to the scorecard
    init() {
        phrases = []
        var buffer = Array(self.database.shuffled().prefix(16)) // Shuffles the buffer and gets the first three
        // Information migration from buffer to scorecard
        for _ in 0..<buffer.count {
            // The status is set at no because when the game starts no phrase is already been said
            phrases.append(Phrase(text: buffer.removeFirst(), status: false, mentor: Mentor(name: "Santo", color: Color.red)))
        }
    }
    
        // Returns true if either the player has checked all the phrases in: a row, a column or a diagonal
    func bingo() -> Bool {
        // Make sure there are only 16 phrases
        guard phrases.count == 16 else {
            print("Error: the array must contain 16 phrases.")
            return false
        }
        
        // Row control
        for row in 0..<4 {
            let startIndex = row * 4
            let rowSlice = phrases[startIndex..<startIndex+4]
            if rowSlice.allSatisfy({ $0.status }) {
                return true
            }
        }
        
        // Column control
        for col in 0..<4 {
            // Costruiamo l'array della colonna corrente
            var colValues: [Phrase] = []
            for row in 0..<4 {
                colValues.append(phrases[row * 4 + col])
            }
            if colValues.allSatisfy({ $0.status }) {
                return true
            }
        }
        
        // Main diagonal
        if (0..<4).allSatisfy({ phrases[$0 * 4 + $0].status }) {
            return true
        }
        
        // Secundary diagonal
        if (0..<4).allSatisfy({ phrases[$0 * 4 + (3 - $0)].status }) {
            return true
        }
        
        // No control has returned successfully, hence there is no bingo
        return false
    }

    
    // Returns true if, the checked phrases in the scorecard are checked also in the other scorecards
    private func check(with scorecard: Scorecard) -> Bool{
        if !overlaps(with: scorecard) { return false } // Returns false if there are no overlappings
        // Picks every phrases and do cross confrontation
        for phrase in self.phrases {
            if !phrase.status { return false } // Returns false if one phrase is not checked
            for checking in scorecard.phrases {
                if phrase.text != checking.text { continue } // Skips iteration if the phrases does not equal
                if !checking.status {
                    return false
                }
            }
        }
        return true
    }
    
    // Returns true if there are some intersections with the other scorecards
    private func overlaps(with scorecard: Scorecard) -> Bool {
        for phrase in self.phrases {
            for checking in scorecard.phrases {
                if phrase.text == checking.text { return true }
            }
        }
        // Returns only if did not return before, so only when there are no intersections
        return false
    }
}

// Describes the phrases that needs to be checked
class Phrase: Identifiable{
    var id: UUID = UUID()
    var text: String = "" // Describe the phrases, English only
    var mentor: Mentor
    var status: Bool = false // Describes if the phrase has been already said
    
    init(text: String, status: Bool, mentor: Mentor) {
        self.text = text
        self.mentor = mentor
        self.status = status
    }
}

struct Mentor {
    var id: UUID = UUID()
    var name: String = ""
    var color: Color = Color.white
}

// TODO: ADD MENTORS IN PHRASE
