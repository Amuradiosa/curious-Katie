
import UIKit

public class Participant {
    
    public var name : String
    public var homeTown : String
    public var interests : Set<String>
    public var matchedConversationPerson : Set<String>
    
    public init (name: String, homeTown: String, interests: Set<String>,matchedConversationPerson: Set<String>) {
        self.name = name
        self.homeTown = homeTown
        self.interests = interests
        self.matchedConversationPerson = matchedConversationPerson
    }
    
    public func introduction() {
        print("\(name):\tHello, my name is \(name), I am from \(homeTown) and I have \(interests.count) interests")
    }
}
