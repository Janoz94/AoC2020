import Foundation

public class Aoc2 {
    let arrayOfValues: [(minimalAmountOfCharacter: Int, maximalAmountOfCharacter: Int, characterToCheck: Character, password: String)]
    
    public init(arrayOfValues: [(minimalAmountOfCharacter: Int, maximalAmountOfCharacter: Int, characterToCheck: Character, password: String)]) {
        self.arrayOfValues = arrayOfValues
    }
    
    public func checkAmountOfProperPasswords() -> Int {
        var amountOfProperPasswords = 0
        for record in arrayOfValues {
            let amountOfLettersInPassword = record.password.filter({ $0 == record.characterToCheck }).count
            
            if amountOfLettersInPassword >= record.minimalAmountOfCharacter, amountOfLettersInPassword <= record.maximalAmountOfCharacter {
                amountOfProperPasswords += 1
            }
        }
        
        return amountOfProperPasswords
    }
}
