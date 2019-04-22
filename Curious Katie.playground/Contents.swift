

import Foundation

// Create an empty array of type Participant to hold our participants
var participants : [Participant] = []

// Generate a number of participants between 2 and 12
let numberOfParticipants = Int.random(in: 2...12)
for _ in 1...numberOfParticipants {
    // give participants name and location randomly and remove the name from the names array to prevent it from being used again
    let randomNameNumber = Int.random(in: 0...names.count - 1)
    let paritcipantName = names.remove(at: randomNameNumber)
    let randomLocationNumber = Int.random(in: 0...cities.count - 1)
    let participantTown = cities[randomLocationNumber]
    // assigning interests to participants, creating array that holds all interests in interests Set
    var participantsInterests : [String] = []
    for (interest,_) in interests {
    participantsInterests.append(interest)
    }
    // Create a set of interests to hold each participant interests
    var eachParticipantInterests : Set<String> = []
    // random number to decide how many interests each participant will have
    let randomNumberOfInterests = Int.random(in: 1...5)
          for _ in 1...randomNumberOfInterests {
             // Picking up interests randomly and assign it to the participant
             let randomInterests = Int.random(in: 0...participantsInterests.count - 1)
             let participantInterest = participantsInterests[randomInterests]
             eachParticipantInterests.insert(participantInterest)
          }
    
    /********************************** Introduction **********************************/
    
    let participant = Participant(name: paritcipantName, homeTown: participantTown, interests: eachParticipantInterests, matchedConversationPerson: Set<String>())
    participants.append(participant)
    participant.introduction()
}

    /********************************** Interests sharing **********************************/

// creating an empty array consists of dictionary elements to hold participants name and interest
var interestSharing = [[String:String]]()
for participant in participants {
    for interest in participant.interests {
        interestSharing.append([participant.name:interest])
    }
}

// iterating through all of the interests of each participant in a random order, logging each participant one at a time
while interestSharing.count > 0 {
    let randomParticipant = Int.random(in: 0...interestSharing.count - 1)
    let participantToShare = interestSharing[randomParticipant]
    // Print each participant name, interest title and description
    for (key,value) in participantToShare {
        print("\(key): \t I like \(value),\(interests[value]!)")
    }
    // Remove the interest from the temporary array so as to not share it again
    _ = interestSharing.remove(at: randomParticipant)
}

/********************************** Participants pairing **********************************/

// create a dicitonary array to hold matched pairs
var matchedPairs = [[String:String]]()
// Iterate through participants to find coversation pairs
for participant in participants {
    for participantForComparison in participants {
        // Compare interest set and populate matchedConversationPerson set with participants that has no elements in common with other.
        if participant.interests.isDisjoint(with: participantForComparison.interests) {
            participant.matchedConversationPerson.insert(participantForComparison.name)
            // We will only add pairs where participant is alphabetically lower than participantForComparison to prevent duplicates
            if participant.name < participantForComparison.name {
            matchedPairs.append([participant.name:participantForComparison.name])
            }
        }
    }
}

// Populate the participants with pairs and the participants with no pairs
var withPairs = [Participant]()
var withoutPairs = [Participant]()
for participant in participants {
        if participant.matchedConversationPerson.count > 0 {
            withPairs.append(participant)
        } else {
            withoutPairs.append(participant)
        }
}

// Print the participants with no pairs
for lonelyParticipant in withoutPairs {
    print("lonley people, \(lonelyParticipant.name) has no pair")
}
// Identify if there are any paired participants
if withPairs.count == 0 {
    print("Katie: \t There are no matched conversation pairs")
} else {
    for couple in matchedPairs {
        for (key, value) in couple {
            print("Katie: \t \(key) and \(value) are a conversation pairing." )
        }
    }
}

/********************************** THE END **********************************/

