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
        "Hello", "Goodbye", "Thank you", "How are you?", "I love you", "I hate you"
    ]
    
    // Get three random and not repetitive strings from the database and associate them to the scorecard
    init() {
        phrases = []
        var buffer = Array(self.database.shuffled().prefix(3)) // Shuffles the buffer and gets the first three
        // Information migration from buffer to scorecard
        for _ in 0..<buffer.count {
            // The status is set at no because when the game starts no phrase is already been said
            phrases.append(Phrase(text: buffer.removeFirst(), status: false, mentor: Mentor(name: "Santo", color: Color.red)))
        }
    }
    
    // Returns true if, the checked phrases in the scorecard are checked also in the other scorecards
    func check(with scorecard: Scorecard) -> Bool{
        if !overlaps(with: scorecard) { return false } // Returns false if there are no overlappings
        // Picks every phrases and do cross confrontation
        for phrase in self.phrases {
            for checking in scorecard.phrases {
                if phrase.text != checking.text { break } // Skips iteration if the phrases does not equal
                if !phrase.status {
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
