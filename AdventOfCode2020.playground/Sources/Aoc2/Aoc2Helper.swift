import Foundation

public class Aoc2Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [(firstValueForCharacter: Int, secondValueForCharacter: Int, characterToCheck: Character, password: String)] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [(firstValueForCharacter: Int, secondValueForCharacter: Int, characterToCheck: Character, password: String)]()

        while let line = readLine() {
            let splitedLine = line.components(separatedBy: " ")
            if let foundedFirstValueForCharacter = Int(splitedLine[0].components(separatedBy: "-")[0]),
               let foundedSecondValueForCharacter = Int(splitedLine[0].components(separatedBy: "-")[1]),
               let foundedCharacterToCheck = splitedLine[1].first {
                let foundedPassword = splitedLine[2]
                
                inputArray.append((firstValueForCharacter: foundedFirstValueForCharacter, secondValueForCharacter: foundedSecondValueForCharacter, characterToCheck: foundedCharacterToCheck, password: foundedPassword))
            }
            }
        return inputArray
    }
}

public extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
