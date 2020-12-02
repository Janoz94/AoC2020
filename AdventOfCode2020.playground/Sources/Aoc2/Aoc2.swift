import Foundation

public class Aoc2 {
    let arrayOfValues: [(firstValueForCharacter: Int, secondValueForCharacter: Int, characterToCheck: Character, password: String)]
    
    public init(arrayOfValues: [(firstValueForCharacter: Int, secondValueForCharacter: Int, characterToCheck: Character, password: String)]) {
        self.arrayOfValues = arrayOfValues
    }
    
    public func checkAmountOfProperPasswords() -> Int {
        var amountOfProperPasswords = 0
        for record in arrayOfValues {
            let amountOfLettersInPassword = record.password.filter({ $0 == record.characterToCheck }).count
            
            if amountOfLettersInPassword >= record.firstValueForCharacter, amountOfLettersInPassword <= record.secondValueForCharacter {
                amountOfProperPasswords += 1
            }
        }
        
        return amountOfProperPasswords
    }
    
    public func checkAmountOfPropeperPasswordWithSecondPolicy() -> Int {
        var amountOfProperPasswords = 0
        for record in arrayOfValues {
            #warning("In future the amount of letters in password may be to short")
            let firstValidatedPasswordLetter = record.password[record.firstValueForCharacter - 1]
            let secondValidatedPasswordLetter = record.password[record.secondValueForCharacter  - 1]
            
            if firstValidatedPasswordLetter != secondValidatedPasswordLetter, (firstValidatedPasswordLetter == record.characterToCheck || secondValidatedPasswordLetter == record.characterToCheck) {
                amountOfProperPasswords += 1
            }
        }
        
        return amountOfProperPasswords
    }
}
