import Foundation

public class Aoc2Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [(minimalAmountOfCharacter: Int, maximalAmountOfCharacter: Int, characterToCheck: Character, password: String)] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [(minimalAmountOfCharacter: Int, maximalAmountOfCharacter: Int, characterToCheck: Character, password: String)]()

        while let line = readLine() {
            let splitedLine = line.components(separatedBy: " ")
            if let foundedMinimalAmountOfCharacters = Int(splitedLine[0].components(separatedBy: "-")[0]),
               let foundedMaximalAmountOfCharacters = Int(splitedLine[0].components(separatedBy: "-")[1]),
               let foundedCharacterToCheck = splitedLine[1].first {
                let foundedPassword = splitedLine[2]
                
                inputArray.append((minimalAmountOfCharacter: foundedMinimalAmountOfCharacters, maximalAmountOfCharacter: foundedMaximalAmountOfCharacters, characterToCheck: foundedCharacterToCheck, password: foundedPassword))
            }
            }
        return inputArray
    }
}
